class MessagesController < ApplicationController
  before_action :authenticate_user!
  # before_action :move_to_index

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message-channel', content: @message
      redirect_to room_messages_path
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   @room = Room.find(params[:room_id])
  #   @message = Message.new
  #   unless @message.user_id == current_user.id 
  #     redirect_to rooms_path
  #   end
  # end 

end
