class Project < ActiveRecord::Base
	validates :title, presence: true
	validates :due_date, presence: true

  belongs_to :user
  has_many :tasks
  has_one :team
end
