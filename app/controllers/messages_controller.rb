class MessagesController < ApplicationController

  def create
    conversation = Conversation.find_by(id: params[:conversation_id])
    recipient = User.find_by(id: params[:recipient_id])
    if conversation
      message = Message.new(message: params[:message], conversation_id: conversation.id)
      message.save
    else
      conversation = Conversation.new()
      if conversation.save
        append_conversation_id(conversation.id, recipient)
        message = Message.new(message: params[:message], conversation_id: conversation.id)
        message.save
      else
        flash[:error] = "Error creating conversation."
      end
    end
  end

  def delete
    message = Message.find_by(message: message)
    message.destroy
  end


  private

  def append_conversation_id(conversation_id, recipient)
    current_user.conversation_ids << conversation_id
    current_user.save
    recipient.conversation_ids << conversation_id
    recipient.save
  end
end
