class ConversationsController < ApplicationController
  
  def delete
    conversation = Conversation.find_by(id: id)
    conversation.destroy
  end


  private

  def conversation_params
    params.require(:user_id, :message)
  end
end
