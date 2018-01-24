class PetsController < ApplicationController

  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :set_pets, only: [:index]
  before_action :current_user, only: [:index, :show, :new, :create, :edit, :destroy]
  # before_action :require_login

  def index
    @not_user_pets = @pets.select{|pet| pet.owner_id != @user.id }
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @newpet = @user.pets.new(pet_params)
    if @newpet.valid?
      @newpet.save
      redirect_to pet_path(id: @newpet.id)
    else
      flash[:error] = @newpet.errors.full_messages
      redirect_to user_pets_new_path
    end
  end

  def edit
  end

  def update
    @pet.assign_attributes(pet_params)
    if @pet.valid?
      @pet.update(pet_params)
      redirect_to pet_path(id: @pet.id)
    else
      flash[:error] = @pet.errors.full_messages
      redirect_to user_edit_pet_path(id: @pet.id)
    end
  end

  def destroy
    flash[:notice] = "#{@pet.name} has been removed."
    @pet.destroy
    redirect_to user_pets_path(@user)
  end

  private

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def require_login
     return head(:forbidden) unless session.include? :user_id
   end

  def set_pet
    @pet = Pet.find_by(id: params[:id])
  end

  def set_pets
    @pets = Pet.all
  end

  def pet_params
    params.require(:pet).permit(:name, :species_id, :pet_photo, :bio)
  end

end
