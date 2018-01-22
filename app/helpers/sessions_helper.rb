module SessionsHelper
  before_action :authorized
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
   !!current_user
   #will return nil if session user id fails or if find by fails
  end

  def authorized
    redirect to login_path unless logged_in?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
