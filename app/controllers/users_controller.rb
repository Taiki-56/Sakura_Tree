class UsersController < ApplicationController


  before_action :authenticate_user, {only: [:show, :logout, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}



  def new
    @user = User.new
  end


  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],            #カラム名を password → password_digest に変更したが
      image_name: "default_user.jpg"          #ここのpassword に代入された値が暗号化されて password_digest に保存されるので、コードは書き換えなくていい
    )

    if params[:image]                                                 #jpgファイル以外をアップロードするにはどう書けばいい？
      @user.image_name = "User.#{@user.name}.jpg"                     #なぜここでは@userのidメソッドが使えない？？　　まだ@userがsaveされていないから？？
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = t "layouts.flash.signup"
      SignupMailer.signup_message(@user).deliver_now
      redirect_to("/users/#{@user.id}")
    else
      @error_message = t ".error_message"
      @name = params[:name]
      @email = params[:email]
      render("users/new")
    end
  end


  def login_form
  end


  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to("/posts/index")
      flash[:notice] = t "layouts.flash.sign_in"
    else
      @error_message = t ".error_message"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end


  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id]).page(params[:page]).per(10)
  end


  def logout
    session[:user_id] = nil
    redirect_to("/")
    flash[:notice] = t "layouts.flash.sign_out"
  end


  def edit
    @user = User.find_by(id: params[:id])
  end


  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]

    if params[:image]
      @user.image_name = "User.#{@user.id}.jpg"                     #更新してからは、"User.ID"で保存
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = t "layouts.flash.user_edit"
    else
      render("users/edit")
    end
  end


  def like
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).all.page(params[:page]).per(10)
  end


  def message_box
    @your_rooms = Room.where(poster_id: @current_user.id).order(created_at: :desc)      #この2つの部屋を1つにまとめられるように改良　　pushメソッドを使おうとするとエラーになる
    @others_rooms = Room.where(user_id: @current_user.id).order(created_at: :desc)     #room のposter_idを消したて一つにまとめたらいける？？
  end


end
