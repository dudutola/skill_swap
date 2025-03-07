class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  def index
    @issues = Issue.order(created_at: :desc)
  end

  def show
    @appointment = Appointment.new
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user

    if @issue.save
      redirect_to @issue, notice: "Issue was successfully created."
    else
      render :new
    end
  end

  def edit
    @user = @issue.user
    redirect_to @issue unless @user == current_user
  end

  def update
    if @issue.update(issue_params)
      redirect_to @issue, notice: "Issue was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user = @issue.user
    redirect_to @issue unless @user == current_user
    @issue.destroy
    redirect_to @issue.user, status: :see_other, notice: "Issue successfully deleted." 
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :description, :available_on)
  end

end
