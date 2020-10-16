class PostsController < ApplicationController


    before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy]}



    def new
      @post = Post.new
    end


    def create
      @post = Post.new(
        content: params[:content],
        user_id: @current_user.id,
        category: params[:category],
        title: params[:title],
        image_name: "default_post.jpg"
      )

      if params[:image]
        @post.image_name = "Post.#{@post.title}.jpg"    #なぜここでは@postのidメソッドが使えない？？　　まだ@postがsaveされていないから？？
        image = params[:image]
        File.binwrite("public/post_images/#{@post.image_name}", image.read)
      end

      if @post.save
        redirect_to("/users/#{@current_user.id}")
        flash[:notice] = t "layouts.flash.post_success"
      else
        @error_message = t ".error_message"
        @content = params[:content]
        @title = params[:title]
        render("posts/new")
      end
    end


    def index
      @posts = Post.all.page(params[:page]).per(10)        # ".page(params[:page])" で投稿数が多い時に次ページに行けるようになる。
    end                                                    # デフォルトは25件で1ページだが、".per(数字)"で指定できる


    def show
      @post = Post.find_by(id: params[:id])
      @user = User.find_by(id: @post.user_id)

      if @current_user                                    #これを定義しないとユーザー登録をしていない、又はログインをしていなければエラーになる
        @current_user_entries = Entry.where(user_id: @current_user.id)
        @post_entries = Entry.where(post_id: @post.id)

        if @post.user_id == @current_user.id
        else
          @current_user_entries.each do |cue|
            @post_entries.each do |pe|
              if cue.room_id == pe.room_id then
                @isRoom = true
                @roomId = cue.room_id
              end
            end
          end
          if @isRoom
          else
            @room = Room.new
            @entry = Entry.new
          end
        end
      end
    end


    def edit
      @post = Post.find_by(id: params[:id])
    end


    def update
      @post = Post.find_by(id: params[:id])
      @post.category = params[:category]
      @post.title = params[:title]
      @post.content = params[:content]

      if params[:image]
        @post.image_name = "Post.#{@post.id}.jpg"                                    #更新してからは、"Post.ID"で保存
        image = params[:image]
        File.binwrite("public/post_images/#{@post.image_name}", image.read)
      end

      if @post.save
        redirect_to("/posts/#{@post.id}")
        flash[:notice] = t "layouts.flash.post_edit"
      else
        @error_message = t ".error_message"
        render("posts/edit")
      end
    end


    def destroy
      @post = Post.find_by(id: params[:id])
      @post.destroy
      redirect_to("/users/#{@post.user_id}")
      flash[:notice] = t "layouts.flash.post_delete"
    end


    def daily_item
      @posts = Post.where(category: "daily_item").page(params[:page]).per(10)
    end


    def vehicle
      @posts = Post.where(category: "vehicle").page(params[:page]).per(10)
    end


    def apartment
      @posts = Post.where(category: "apartment").page(params[:page]).per(10)
    end


    def job
      @posts = Post.where(category: "job").page(params[:page]).per(10)
    end


    def service
      @posts = Post.where(category: "service").page(params[:page]).per(10)
    end


    def community
      @posts = Post.where(category: "community").page(params[:page]).per(10)
    end


end
