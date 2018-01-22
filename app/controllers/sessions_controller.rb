class SessionsController < ApplicationController

  skip_before_action :authorized, [:new, :create]

  def new
      # nothing to do here!
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    # byebug
    if @user && @user.authenticate(params[:password])
      # session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
   log_out
   redirect_to login_path
  end

end
