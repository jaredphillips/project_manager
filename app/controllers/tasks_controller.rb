class TasksController < ApplicationController
	before_filter :load_project

  def new
  	@task = Task.new
  end

  def create
  	@task = Task.new(task_params)
  end

private
  
  def task_params
	  params.require(:user).permit(
	  	project_id: @project.id, 
	  	user_id: @user.id, 
	  	due_date: params[:due_date], 
	  	instructions: params[:instructions],
      complete: false
  	)
  end

  def load_project
  	@project = Project.find(params[:project.id])
  end
end
