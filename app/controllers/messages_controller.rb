class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.all.includes(:user)
  end

  def create
    @message = Message.new(post_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to group_messages_path(@group), notice: "メッセージが送信されました。" }
        format.json
      else
        format.html { redirect_to group_messages_path(@group), alert: "メッセージを入力してください" }
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
end

