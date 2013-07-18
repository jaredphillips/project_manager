# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	first_name "Terry"
  	last_name "Phillips"
  	sequence(:email) { |n| "terry#{n}@email.com" }
  	password "password"
  end
end
