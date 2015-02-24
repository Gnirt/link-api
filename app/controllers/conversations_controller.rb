class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  end

  def show
    if @conversation.is_unread?(current_user)
      @conversation.mark_as_read(current_user)
      flash[:success] = 'The conversation was marked as read.'
    end
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  def mark_as_read
    @conversation.mark_as_read(current_user)
    flash[:success] = 'The conversation was marked as read.'
    redirect_to conversations_path
  end

  private

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end
end