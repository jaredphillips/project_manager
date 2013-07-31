class ProjectsController < ApplicationController

  def new
    @project = Project.new()
  end

  def create
    @project = Project.new(
      user_id: params[:user_id],
      title: params[:project][:title],
      objective: params[:project][:objective],
      due_date: params[:project][:due_date]
    )
    
    if @project.save 
      redirect_to current_user
    else

      render new_project_path
    end
  end

  def index
    @projects = Projects.find(param[:id])
  end

  def show
    @projects = Project.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  def update
  end
end

