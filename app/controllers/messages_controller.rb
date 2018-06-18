class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  before_action :set_messages, only: [:index, :create]

  def index
    @message = Message.new
    @append_messages = []
    last_message_id = params[:last_message_id].to_i
    @messages.each do |message|
      if message.id > last_message_id
        @append_messages << message
      end
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = Message.new(post_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group), notice: "メッセージが送信されました。" }
        format.json
      end
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
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

