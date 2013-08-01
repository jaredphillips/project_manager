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
    @projects = Projects.where(params[:id])
  end

  def show
    @project = Project.find(params[:id])
    if @tasks == nil
      @tasks = @project.tasks
    else
      @tasks = @project.tasks.sort_by{ |organize_by| organize_by[:due_date] }
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end
end

