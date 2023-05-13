class Public::MessagesController < ApplicationController
  
  before_action :authenticate_user!

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.new(message_params)
      if @message.save
        redirect_to room_path(@message.room_id)
      else
        flash[:notice] = "メッセージを入力してください"
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private 
  
  def message_params
      params.require(:message).permit(:user_id, :body, :room_id).merge(user_id: current_user.id)
  end
end
