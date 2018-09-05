class ConversationsController < ApplicationController
  def index
    @conversations = policy_scope(Conversation)
  end

  def create
    if Conversation.between(params[:user1_id],params[:user2_id])
     .present?
      authorize @conversation = Conversation.between(params[:user1_id],
       params[:user2_id]).first
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
