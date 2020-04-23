class UsersController < ApplicationController
  #made
  def index
    @user = User.all
  end

  def show
    @users = User.find(params[:id])
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
      @users.update(conversation_ids: [])
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

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :is_tutor, :bio, :subject)
    end
  end
