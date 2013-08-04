class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
  def invite_email(invite)
    @sender = invite.team.user
    @token = invite.token
    @email = invite.email
    @url = "http://localhost:3000/users/new/#{@token}"
    mail(to: @email, subject: "You've been invited to....")
  end
end
