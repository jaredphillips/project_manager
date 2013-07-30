class TasksController < ApplicationController
	before_filter :load_project

  def new
  	@task = Task.new()
  end

  def create
  	@task = Task.new(
  		project_id: @project.id,
  		user_id: current_user,
  		due_date: params[:task][:due_date],
  		instructions: params[:task][:instructions],
  		complete: false
  	)
  	
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

# Schema

# create_table "tasks", force: true do |t|
#     t.integer  "project_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#     t.integer  "user_id"
#     t.datetime "due_date"
#     t.string   "instructions"
#     t.boolean  "complete",     default: false
#   end
