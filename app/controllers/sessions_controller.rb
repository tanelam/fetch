class SessionsController < ApplicationController


  def new
      # nothing to do here!
  end

  def create
    @user = User.find_by(username: params[:username])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end


  # def create
  #   user = User.find_by(name: params[:session][:name].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     log_in user
  #     redirect_to user_url(user)
  #   else
  #     flash.now[:errors] = 'Invalid email/password combination'
  #     render 'new'
  # end

  def destroy
   log_out
   redirect_to root_url
  end

end
