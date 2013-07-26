class InviteMailer < ActionMailer::Base
  default from: "hello@email.com"

  def invitation(user, invitation, signup_url) 	
  	mail(to: :recipient_email,
  		   from: user.email,
         subject: "You have been invited you to join the team",
         body: signup_url
    )
  end
end