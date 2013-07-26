class Invitation < ActiveRecord::Base
	belongs_to :sender, class_name: "User"
	# railscasts uses this syntax :class_name => 'User'
	has_one :recipient, class_name: "User"

  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :recipient_email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	validate :recipient_is_not_registered

  def recipient_is_not_registered
  	errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
  end

  def generate_token
  	self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
