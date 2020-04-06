class SessionsController < ApplicationController
  def create
    if login_params[:is_tutor] == true
      login = Tutor.find_by(email:login_params[:email])
    else
      login = User.find_by(email:login_params[:email])
    end
    if login && login.authenticate(login_params[:password])
      session[:user_id] = login.id
      redirect_to "/dashboard#{login_params[:is_tutor]}"
    else
      redirect_to "/login"
      flash[:error] = "Incorrect email or password. Please try again."
    end
  end

  def show
    render 'users/invalid'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  private
  def login_params
    params.require(:login).permit(:email, :password)
  end
end
