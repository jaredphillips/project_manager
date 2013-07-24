class ProjectsController < ApplicationController
  before_filter :load_user
  before_filter :require_login

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
      @user.add_role :admin, @project
      # UserMailer.reservation_confirmation(current_user).deliver
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def index
    @projects = Project.where(user_id: @user).sorted_by(params[:project][:due_date])
  end

  def show
    @project = Project.find(@user)
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
