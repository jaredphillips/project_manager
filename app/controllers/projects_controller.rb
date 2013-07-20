class ProjectsController < ApplicationController

  before_filter :load_user

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
      # UserMailer.reservation_confirmation(current_user).deliver
      flash[:notice] = "Project created!"
    else
      render 'new'
    end
    
    respond_to do |format|
      format.html { redirect_to project_url }
      format.js
    end
  end

  def index
    @projects = Project.where(user_id: @user)
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

private

  def load_user
    @user = User.find(params[:user_id])
  end
end
