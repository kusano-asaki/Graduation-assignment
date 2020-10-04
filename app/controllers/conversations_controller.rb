class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def create
    if logged_in?
      # binding.pry
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)
    else
    redirect_to user_path(current_user.id)
    end
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
