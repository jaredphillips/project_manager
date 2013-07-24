class TeamsController < ApplicationController
  
  def new
    @user = User.find(params[:user_id])
    @team = Team.new()
  end

  def create
    @user = User.find(params[:user_id])
    @team = Team.new(team_params)

    if @team.save
      flash.now = "Team Created"
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  def update
  end

private
  
  def team_params
    params.require(:team).permit(:email, :user_id)
  end
end