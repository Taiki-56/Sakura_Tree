class RoomsController < ApplicationController


  before_action :authenticate_user



  def create            # hidden_field で指定した値は、params[:値を受け取るテーブル名][:鍵の名前]で受け取れる
    @post = Post.find_by(id: params[:room][:post_id])
    @room = Room.new(
      user_id: @current_user.id,
      post_id: @post.id,
      poster_id: @post.user_id
    )
    @room.save

    @entry1 = Entry.create(       # for people who wanna contact with posters
      room_id: @room.id,
      user_id: @current_user.id,
      post_id: @post.id
     )

     @entry2 = Entry.create(      # for the posters
       room_id: @room.id,
       user_id: @post.user_id,
       post_id: @post.id
     )

    redirect_to "/rooms/#{@room.id}"
  end


  def show
    @room = Room.find(params[:id])

    @post = Post.find(@room.post_id)

    @user1 = User.find(@room.user_id)
    @user2 = User.find(@room.poster_id)

    @all_messages =  Message.where(room_id: @room.id)

    @message = Message.new                    #これで送られてきたデータを　create ページに飛ばす

    if @user1.id == @current_user.id          #自分の情報を右側に表示させるため
      @you = @user1
      @your_messages = Message.where(room_id: @room.id, user_id: @you.id)
      @other = @user2
      @others_messages = Message.where(room_id: @room.id, user_id: @other.id)
    else
      @you = @user2
      @your_messages = Message.where(room_id: @room.id, user_id: @you.id)
      @other = @user1
      @others_messages = Message.where(room_id: @room.id, user_id: @other.id)
    end
  end


end
