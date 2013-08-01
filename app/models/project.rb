class Project < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	has_many :users

	validates :title, presence: true
	validates :due_date, presence: true
end
