class PetsController < ApplicationController

  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :set_pets, only: [:index]
  # before_action :require_login

  def index
    # @
    # if @user.pets.empty?
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    # byebug
    @pet = Pet.new(pet_params)
      # byebug
      current_user = User.find_by(id: session[:user_id])
      @pet.owner_id = current_user.id
    if @pet.valid?
      @pet.save

      redirect_to @pet
    else
      flash[:error] = @pet.errors.full_messages
      redirect_to new_pet_path
    end
  end

  def edit
    #no reason for this? i guess maybe you changed your pets name?
    #or maybe we give pet a bio page? far from now
  end

  def update
    @pet.assign_attributes(pet_params)
    if @pet.valid?
      @pet.update(pet_params)
      redirect_to @pet
    else
      flash[:error] = pet.errors.full_messages
      redirect_to edit_pet_path
    end
  end

  def destroy
    #pets die sometimes so this one needs to be here
    @pet.destroy
    redirect_to @pets
  end

  private

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
