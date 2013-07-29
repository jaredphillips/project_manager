class Project < ActiveRecord::Base

	has_many :invitations
	has_many :tasks
  
	has_many :project_members
	has_many :users

	validates :title, presence: true
	validates :due_date, presence: true

end
