class UsersController < ApplicationController
  before_action :user, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authorized, [:new, :create]
  before_action :user_pets, only: [:pets]
  

  def pets

  end

  def new
    @user = User.new
  end
  #
  # if sessions[:user_id]
  #   @user = User.find(session[:user_id])
  #   @pets = User.pets
  # end

  # if logged_in?
  #   stuff here
  # else
  # end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user.valid?
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    @user.destroy
    # log them out of web page
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation)
  end

  def user
    @user = User.find_by(id: session[:user_id])
  end

  def user_pets
    @user = User.find_by(id: session[:user_id])
    @user_pets = @user.pets
  end

end
