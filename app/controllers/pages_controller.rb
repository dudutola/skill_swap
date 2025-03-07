class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @current_user = current_user

  end

  def profile_user
    @user = User.find(params[:id])
    @appointments = Appointment.where("tutor_id = ? OR pupil_id = ?", @user.id, @user.id)
  end
end
