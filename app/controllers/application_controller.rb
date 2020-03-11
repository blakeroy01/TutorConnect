class ApplicationController < ActionController::Base
	#do not touch this yet
  helper_method :current_user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
