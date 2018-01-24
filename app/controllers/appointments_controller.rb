

class AppointmentsController < ApplicationController

before_action :set_appointment, only: [:show, :edit, :update, :destroy]
before_action :set_appointments, only: [:index]
before_action :current_user, only: [:index, :new, :edit]

  def index
    @your_appointments = @appointments.select{|appointment| appointment.sitter_id == @user.id }
  end


  def new
    @appointment = Appointment.new
    @pet = Pet.find_by(id: params[:pet_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      flash[:error] = @appointment.errors.full_messages
      redirect_to new_appointment_path(@appointment)
    end
  end

  def show
  end

  def edit
    @pet = @appointment.cuddle_buddy
  end

  def update
    @appointment.assign_attributes(appointment_params)
    if @appointment.valid?
      @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      flash[:error] = @appointment.errors.full_messages
      redirect_to edit_appointment_path(@appointment)
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def set_appointments
    @appointments = Appointment.all
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:sitter_id, :cuddle_buddy_id, :checkin, :checkout)
  end


end
