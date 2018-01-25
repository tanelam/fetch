class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :logged_in?
  helper_method :current_user

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
   !!current_user
  end


  def require_login
    redirect_to '/login' unless logged_in?
  end

end
