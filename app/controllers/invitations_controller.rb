class InvitationsController < ApplicationController
  def new
  	@invitation = Invitation.new()
  end

  def create
  	@invitation = Invitation.new(invitation_params)
  	if @invitation.save
      @invitation.sender = current_user
  		InviteMailer.invitation(current_user, @invitation, signup_url(@invitation.generate_token)).deliver
  		flash[:notice] = "Thank you, invitation sent."
  		redirect_to current_user
  	else
  		render 'new'
  	end
  end


private

	def invitation_params
		params.require(:invitation).permit(:sender_id, :recipient_email, :token)
	end
end
