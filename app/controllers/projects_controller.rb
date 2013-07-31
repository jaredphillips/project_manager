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
      redirect_to user_path(@user)
    else
      
      render new_project_path
    end
  end

  def index
  end

  def show
    @project = Project.find(params[:id])
    @tasks = Task.where(project: @project)
  end

  def edit
  end

  def destroy
  end

  def update
  end
end

