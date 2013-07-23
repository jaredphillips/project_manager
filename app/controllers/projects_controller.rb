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
      flash[:success] = "Project saved"
      redirect_to user_path(@user)
    else
      flash[:error] = "Didn't save"
      render 'new'
    end
  end

  def index
    @projects = Project.where(user_id: @user)
  end

  def show
    @project = Project.find(user_id: @user)
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
