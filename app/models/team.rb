class Team < ActiveRecord::Base
	has_many :team_members
	has_many :mass_invites
	belongs_to :user
end
