class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @issues_count = []
    @project_null = 0
    @projects.each do |project|
      @issues_count[project.id] = project.issues.count
      if project.issues.count == 0
        @project_null += 1
      end 
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @project.save
    redirect_to projects_path
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    redirect_to projects_path
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end
end
