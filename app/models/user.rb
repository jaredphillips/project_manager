class User < ActiveRecord::Base
	authenticates_with_sorcery!

	validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :email, presence: true, uniqueness: true
end
