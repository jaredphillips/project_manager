class User < ActiveRecord::Base
	authenticates_with_sorcery!
	before_save { self.email = email.downcase }
	has_many :projects
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates_confirmation_of :password
  validates_presence_of :password, on: :create

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }

end
