class TasksController < ApplicationController
  before_filter :load_project

  def new
  	@task = Task.new()
  end

  def create
  	@task = Task.new(
  		project_id: params[:project_id],
  		user_id: current_user,
  		due_date: params[:task][:due_date],
  		instructions: params[:task][:instructions],
  		complete: false
  	)
  	binding.pry
  	if @task.save
  		redirect_to @project
  	else
  		"Nope"
  	end
  end

  def show
    @tasks = Task.find(params[:project_id])
  end

private

  def load_project
    @project = Project.find(params[:project_id])
  end
end