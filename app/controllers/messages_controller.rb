class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_room, only: [:index, :create]

  def index
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  def set_room
    @rooms = Room.all
    @room = Room.find(params[:room_id])
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
