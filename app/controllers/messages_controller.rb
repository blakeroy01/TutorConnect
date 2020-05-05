class MessagesController < ApplicationController

  def create(recipient_id: nil)
    if recipient_id
      recipient = User.find_by(id: recipient_id)
    else
      recipient = User.find_by_id(session[:tutor_id])
    end
    conversation = Conversation.find_by(id: (current_user.conversation_ids & recipient.conversation_ids).first)
    if conversation
      message = Message.new(message: params[:message], conversation_id: conversation.id, user_id: current_user.id)
      message.save
    else
      conversation = Conversation.new()
      if conversation.save
        append_conversation_id(conversation.id, recipient)
        message = Message.new(message: params[:message], conversation_id: conversation.id, user_id: current_user.id)
        message.save
      else
        flash[:error] = "Error creating conversation."
      end
    end
  end

  def refresh
    create(recipient_id: params[:recipient_id])
    index
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
