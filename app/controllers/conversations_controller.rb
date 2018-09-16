class ConversationsController < ApplicationController
  def index
    @conversations = policy_scope(Conversation)
    @unread = 0
    @conversations.each do |conv|
      @unread += 1 if conv.messages.last.read == false
    end
  end

  def create
    if Conversation.between(params[:user1_id],params[:user2_id], params[:apartment_id])
     .present?
      authorize @conversation = Conversation.between(params[:user1_id],
       params[:user2_id], params[:apartment_id]).first
    else
      authorize @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:user1_id, :user2_id, :apartment_id)
  end
end
