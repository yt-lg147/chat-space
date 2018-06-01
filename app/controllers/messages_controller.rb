class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  before_action :set_messages, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(post_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to group_messages_path(@group), notice: "メッセージが送信されました。" }
        format.json
      else
        flash.now[:alert] = "メッセージを入力してください"
        format.html { render :index }
      end
    end
  end

private
  def post_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages.includes(:user)
  end
end

