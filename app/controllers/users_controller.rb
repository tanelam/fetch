class UsersController < ApplicationController
  before_action :user, only: [:show, :edit, :update, :destroy]
  before_action :user_pets, only: [:pets]

  skip_before_action :require_login, only: [:new, :create, :show]

  def pets
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in @user
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
