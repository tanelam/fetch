class PetsController < ApplicationController

  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  before_action :set_pets, only: [:index]

  def index
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    # byebug
    @pet = Pet.new(pet_params)
    if @pet.valid?
      @pet.save
      redirect_to @pet
    else
      flash[:error] = @pet.errors.full_messages
      render :new
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
      render :edit
    end
  end

  def destroy
    #pets die sometimes so this one needs to be here
    @pet.destroy
    redirect_to @pets
  end

  private

  def set_pet
    @pet = Pet.find_by(id: params[:id])
  end

  def set_pets
    @pets = Pet.all
  end

  def pet_params
    params.require(:pet).permit(:name, :owner_id, :species_id, :pet_photo, :bio)
  end

end
