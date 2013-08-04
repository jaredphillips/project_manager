class Invite < ActiveRecord::Base
  before_create :generate_token
	after_create :send_email


  belongs_to :team
  belongs_to :mass_invite

  def send_email
    UserMailer.invite_email(self).deliver
  end

  def generate_token
  	self.token = loop do 
  		random_token = SecureRandom.urlsafe_base64(nil, false)
  		break random_token unless Invite.where(token: random_token).exists? 
  	end
  end
end
