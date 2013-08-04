class User < ActiveRecord::Base

	authenticates_with_sorcery!
	before_save { self.email = email.downcase }

  has_many :projects
  has_many :tasks, through: :projects
  has_many :teams



  
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 } 
  
  validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }

	mount_uploader :avatar, AvatarUploader
end
