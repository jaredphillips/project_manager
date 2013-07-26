class ProjectMember < ActiveRecord::Base
	has_many :users
	has_many :projects
end
