class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    if @current_user.id == @conversation.sender_id || @current_user.id == @conversation.recipient_id
    @messages = @conversation.messages
    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
    else
      redirect_to user_path(current_user.id), notice: 'アクセス権限はありません'
    end
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      render 'index'
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
