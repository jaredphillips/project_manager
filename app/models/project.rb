class Project < ActiveRecord::Base
	validates :title, presence: true
	validates :due_date, presence: true

	has_many :users, through: :team
	has_one :team
  has_many :tasks
end
