class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?

  # before_action :authorized

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    else
    end
  end

  def logged_in?
   !current_user.nil?
   #will return nil if session user id fails or if find by fails
  end

  # def authorized
  #   redirect to login_path unless logged_in?
  # end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
