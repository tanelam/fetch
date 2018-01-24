class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    # byebug
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    # log_out
    redirect_to login_path
  end

end
