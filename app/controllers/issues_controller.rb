class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  def index
    @issues = policy_scope(Issue)
  end

  def show
    authorize @issue
    @appointment = Appointment.new
  end

  def new
    @issue = Issue.new
    authorize @issue  # Ensure the user is authorized to create a new issue
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user
    authorize @issue  # Ensure the user is authorized to create the issue

    if @issue.save
      if params[:issue][:new_tags].present?
        new_tags = params[:issue][:new_tags].split(",").map(&:strip)
        new_tags.each do |tag_name|
          tag = Tag.find_or_create_by(name: tag_name)
          @issue.tags << tag unless @issue.tags.include?(tag)
        end
      end

      redirect_to @issue, notice: "Issue was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = @issue.user
    authorize @issue  # Ensure the user is authorized to edit the issue
    redirect_to @issue unless @user == current_user
  end

  def update
    authorize @issue  # Ensure the user is authorized to update the issue

    if @issue.update(issue_params)
      redirect_to @issue, notice: "Issue was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @issue  # Ensure the user is authorized to destroy the issue

    @user = @issue.user
    redirect_to @issue unless @user == current_user
    @issue.destroy
    redirect_to issues_path, status: :see_other, notice: "Issue successfully deleted."
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :description, :available_on, tag_ids: [], new_tags: [])
  end
end
