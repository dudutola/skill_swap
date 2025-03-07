class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update]

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
  end

  def update
    if @issue.update(issue_params)
      redirect_to @issue, notice: "Issue was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:title, :description, :available_on, tag_ids: [], new_tags: [])
  end
end
