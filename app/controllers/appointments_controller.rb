class AppointmentsController < ApplicationController
  before_action :set_issue, only: [:new, :create]
  before_action :set_appointment, only: [:confirm, :decline]

  def new
    @appointment = Appointment.new(start_time: Time.now, end_time: Time.now + 1.hour)
  end

  def create
    @appointment = @issue.appointments.build(appointment_params)
    @appointment.pupil_id = @issue.user.id
    @appointment.tutor_id = current_user.id

    if @appointment.save
      redirect_to @issue, notice: "Appointment scheduled successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirm
    if @appointment.update(status: "confirmed")
      redirect_to profile_user_path(current_user), notice: "Appointment confirmed!"
    else
      redirect_to profile_user_path(current_user), alert: "Failed to confirm the appointment."
    end
  end

  def decline
    if @appointment.update(status: "declined")
      redirect_to profile_user_path(current_user), notice: "Appointment declined."
    else
      redirect_to profile_user_path(current_user), alert: "Failed to decline the appointment."
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_issue
    @issue = Issue.find(params[:issue_id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time)
  end
end
