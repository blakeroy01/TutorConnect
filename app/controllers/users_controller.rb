class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/pre_dashboard'
    else
      flash[:register_errors] = user.errors.full_messages
      render 'users/pop_up'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
