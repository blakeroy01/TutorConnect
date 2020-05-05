class UsersController < ApplicationController
  #made
  def index
    @users = User.all
  end

  def search
    @query = params[:q].capitalize
    @users = User.where("subject LIKE ?", "%" + @query + "%")
  end

  def rate
    @current_user.conversation_ids.each do | cid |
      @users = User.where(":cid = ANY(conversation_ids)")
    end
  end
  


  def show
    @u = User.find(params[:id])
    session[:tutor_id] = @u.id
  end

  #made
  def new
    @users = User.new(user_params)
  end

  #made
  def edit
    @users = User.find(params[:id])
  end

  def create
    @users = User.new(user_params)
    if @users.save
      flash[:success] = "Account created"
      session[:user_id] = @users.id
      @users.update(conversation_ids: [], rating: 0, rating_count: 0)
      session[:user_id] = @users.id
      redirect_to "/pre_dashboard#{user_params[:is_tutor]}"
    else
      redirect_to "/register"
      if User.exists?
        flash[:error] = "Account exists. Please login with that account."
      else
        flash[:error] = "Account creation error."
      end
    end
  end

  #made
  def update
    @users = User.find(params[:id])

    if @users.update(user_params)
      redirect_to settings_path
    else
      render 'edit'
      if User.exists?
        flash[:error] = "Account exists. Please change the username or email again."
      end
    end
  end

  #made
  def destroy
    current_user.destroy
    redirect_to root_url
  end

  #made
  def addreview
    @u = User.find_by_id(session[:tutor_id])
    if params[:r]
      if params[:r].to_i > 5
        flash.alert = "Read instructions"
      else
        rating_count = @u.rating_count + 1
        rating = params[:r].to_i + @u.rating
        @u.update(rating: rating)
        @u.update(rating_count: rating_count)
        flash[:success] = "Review added"
      end
    end
  end


  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :is_tutor, :bio, :subject)
    end

  end
