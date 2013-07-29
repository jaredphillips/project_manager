class InvitationsController < ApplicationController
  def new
  	@invitation = Invitation.new()
  end

  def create
  	@invitation = Invitation.new(invitation_params)
  	if @invitation.save    
  		InviteMailer.invitation(current_user, @invitation, signup_with_token_url(@invitation.token), project_id: project.id).deliver
  		flash[:notice] = "Thank you, invitation sent."
  		redirect_to current_user
  	else
  		render 'new'
  	end
  end

private

	def invitation_params
		params.require(:invitation).permit(:user_id, :email, :token, :project_id)
	end
end



