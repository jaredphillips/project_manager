# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email "terry@email.com"
  	sequence(:email) { |n| "terry#{n}@email.com" }
  	password "password"
  end
end
