class ApplicationController < ActionController::Base
	#do not touch this yet
  helper_method :current_user, :index
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def index
    @users_with_conversations = []
    current_user.conversation_ids.each do |id|
      user = User.where(" #{id} = ANY(conversation_ids)")
      if user.last.username == current_user.username
        @users_with_conversations << user.first
      else
      @users_with_conversations << user.last
      end
    end
      @messages = Message.where(conversation_id: params[:conversation_id])
      @messaged_user = User.find_by(id: params[:user_id])
    render 'dashboard/dashboard'
  end

end
