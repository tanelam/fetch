class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :logged_in?, :current_user

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
   !!current_user
  end

  # def log_out
  #   session.delete(:user_id)
  #   @current_user = nil
  # end

  def require_login
    redirect_to '/login' unless logged_in?
  end

end
