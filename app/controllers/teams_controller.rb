class TeamsController < ApplicationController

  def new
  	@team = Team.new()
  end

  def create
  	@team = current_user.teams.new(team_params)
  	if @team.save
  		redirect_to current_user
  	else
  		render 'new'
  	end
  end

  def index
  	@teams = current_user.teams
    @joined_teams = TeamMember.where(user: current_user).pluck(:team_id).map { |team_id| Team.find(team_id) }
  end

  def show
  	@team = Team.find(params[:id])
    @joined_teams = TeamMember.where(user: current_user).pluck(:team_id).map { |team_id| Team.find(team_id) }
  end


private

  def team_params
	  params.require(:team).permit(:team_name)
  end
end
