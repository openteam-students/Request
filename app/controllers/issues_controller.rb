class IssuesController < ApplicationController
  def index
    @project=Project.find(params[:project_id])
    @issues = @project.issues
  end

  def show
    @issue = Issue.find(params[:id])
    @project = @issue.project
  end

  def new
    @project=Project.find(params[:project_id])
    @issue = @project.issues.new
  end

  def edit
    @issue = Issue.find(params[:id])
    @project = @issue.project
  end

  def create
    @project=Project.find(params[:project_id])
    @issue = @project.issues.new(params[:issue])
    @issue.save
    redirect_to project_issues_path(@project)
  end

  def update
    @issue = Issue.find(params[:id])
    @issue.update_attributes(params[:issue])
    @project = @issue.project
    redirect_to project_issues_path(@project)
  end

  def destroy
    @issue = Issue.find(params[:id])
    @project = @issue.project
    @issue.destroy
    redirect_to project_issues_path
  end
end
