class ConversationsController < ApplicationController
  def index
    @conversations = policy_scope(Conversation)
  end

  def create
    if Conversation.between(params[:user1_id],params[:user2_id])
     .present?
      @conversation = Conversation.between(params[:user1_id],
       params[:user2_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:user1_id, :user2_id)
  end
end
