class MassInvitesController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
  	@mass_invite = MassInvite.new
  	1.times do
  		@mass_invite.invites.build
  	end
  end

  def create
  	@team = Team.find(params[:team_id])
  	@mass_invite = @team.mass_invites.new(mass_invites_params)
  	if @mass_invite.save

  		redirect_to current_user
  	else
  		render 'new'
  	end

  end

private 
  
  def mass_invites_params
  	params.require(:mass_invite).permit(invites_attributes: [:email, :team_id])
  end
end
