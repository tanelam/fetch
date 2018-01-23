

class AppointmentsController < ApplicationController

  def index
  end

  def new
    @appointment = Appointment.new
    @user = User.find_by(id: params[:user_id])
    @pet = Pet.find_by(id: params[:pet_id])

  end

  def create
    # byebug
    @appointment = Appointment.new(sitter_id: params[:user_id], cuddle_buddy_id: params[:pet_id], checkin: params[:checkin], checkout: params[:checkout])
    if @appointment.valid?
      @appointment.save
      redirect_to user_appointment_path

    else
      flash[:error] = @appointment.errors.full_messages
      redirect_to user_new_appointment_path

    end
  end

  private

  # def appointment_params
  #   params.require(:appointment).permit(:user_id, :pet_id, :checkin, :checkout)
  # end


end
