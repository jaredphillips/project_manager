class Invitation < ActiveRecord::Base
  after_initialize :generate_token, on: :create

  belongs_to :project

	validates :email, presence: true
	validate :recipient_is_not_registered

  def recipient_is_not_registered
  	errors.add :email, 'is already registered' if User.find_by_email(email)
  end

  def generate_token
  	self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
