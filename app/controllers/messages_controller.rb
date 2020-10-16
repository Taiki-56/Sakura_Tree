class MessagesController < ApplicationController


  before_action :authenticate_user



  def create
    if Entry.where(user_id: @current_user.id, room_id: params[:message][:room_id])
      @message = Message.create(params.require(:message).permit(:user_id, :message, :room_id).merge(:user_id => @current_user.id))
      redirect_to("/rooms/#{@message.room_id}")                       # strong parameter というやつで、require(:モデル名).permit(:受け取るカラム名？).merge(:指定して受け取りたいカラム名とデータ？？)　要勉強
    else
      redirect_back(fallback_location: root_path)
    end
  end


end
