class ProjectsController < ApplicationController

  before_filter :load_user

  def new
    @project = Project.new()
  end

  def create
  end

  def index
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
