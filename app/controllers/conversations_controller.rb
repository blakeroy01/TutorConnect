class ConversationsController < ApplicationController

  def show
    conversation_messages = Message.where(conversation_id: this_id)
  end

  def delete
    conversation = Conversation.find_by(id: id)
    conversation.destroy
  end


  private

  def conversation_params
    params.require(:user_id, :message)
  end
end
