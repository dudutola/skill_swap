class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @appointments = Appointment.where("tutor_id = ? OR pupil_id = ?", @user.id, @user.id)
  end

  def profile
    @current_user = current_user
  end
end
