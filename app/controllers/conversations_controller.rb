class ConversationsController < ApplicationController

  def show
    render ''
  end

  def create
    @tutor = current_user
    @student = User.find_by(id: requesting_student.id)
    @conversation = Conversation.create(
      tutor_id: ,
      second_user_id: params[:second_user_id]
    )
  end

  def create_request
    current_user.add_request
  end

  def requesting_student
    @requesting_student = User.find_by
  end

  private

  def conversation_params
    params.permit(:username, :id)
  end
end
