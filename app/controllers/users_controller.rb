class UsersController < ApplicationController
  #made
  def index
    @user = User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Account created"
      session[:user_id] = user.id
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
  def new
    @user = User.new
  end

  #made
  def edit
    @user = User.find(user_params[:id])
  end

  #made
  def show
    @user = User.find(user_params[:id])
  end

  #made
  def update
    @user = User.find(user_params[:id])
    if @user.update
      redirect_to @user, notice: 'Updated!'
    else
      render 'edit'
    end
  end

  #made
  def destroy
    @user = User.find(user_params[:id])
    @user.destroy

    redirect_to root_url, notice: 'Deleted'
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :is_tutor)
    end
  end
