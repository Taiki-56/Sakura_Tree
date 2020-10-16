class ApplicationController < ActionController::Base


  before_action :set_current_user, :set_locale



  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end


  def authenticate_user
    if @current_user == nil
      redirect_to("/login")
    end
  end


  def forbid_login_user
    if @current_user
      redirect_to("/users/#{@current_user.id}")
    end
  end


  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to("/")
    end
  end


  #言語設定

  private def set_locale                                      #ページを更新するたびに、言語がデフォルトにもどってしまう　なぜ？？？
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end



end
