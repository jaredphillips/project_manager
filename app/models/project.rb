class Project < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	has_many :users

  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :all_blank
	validates :title, presence: true
	validates :due_date, presence: true
end
