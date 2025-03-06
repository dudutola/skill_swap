class IssuesController < ApplicationController
  def index
    @issues = Issue.order(created_at: :desc)
  end

  def show
    @issue = Issue.find(params[:id])
    @appointment = Appointment.new
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user

    if @issue.save
      redirect_to @issue
    else
      render :new
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
