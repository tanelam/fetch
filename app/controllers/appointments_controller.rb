

class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
    @user = User.find_by(id: session[:user_id])
    @your_appointments = @appointments.select{|appointment| appointment.sitter_id == @user.id }
  end


  def new
    @appointment = Appointment.new
    @user = User.find_by(id: params[:user_id])
    @pet = Pet.find_by(id: params[:pet_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.valid?
      @appointment.save

      redirect_to appointment_path(@appointment)

    else
      flash[:error] = @appointment.errors.full_messages
      redirect_to new_appointment_path

    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @pet = @appointment.cuddle_buddy
    @user = User.find_by(id: session[:user_id])
    # @pet = Pet.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    redirect_to appointment_path(@appointment)

  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:sitter_id, :cuddle_buddy_id, :checkin, :checkout)
  end


end
