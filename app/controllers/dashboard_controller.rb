class DashboardController < ApplicationController
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
    @messages = Message.where(conversation_id: current_user.conversation_ids)
    render 'dashboard/dashboard'
  end

  def pre_index
    render 'dashboard/pre_index'
  end

  def pre_index_tutor
    render 'dashboard/pre_index_tutor'
  end

  def update_bio_subjects
    current_user.update(bio: params[:bio], subject:split_subjects)
    index
  end

  private
  def login_params
    params.require(:bio).permit(:subjects)
  end

  def split_subjects()
    if params[:subject]
      if params[:subject].length > 1
        params[:subject].split(',')
      elsif params[:subject] == ''
        params[:subject] = []
      else
        params[:subject]
      end
    else
      nil
    end
  end
end
