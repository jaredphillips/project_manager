# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
  	user_id 1
  	project_id 1
  	name "Awesome Project"
  	owner true 
  end
end