# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
  	title "First Project Title"
  	objective "Here is the project objective"
  	due_date 
  	completed false

  	factory :project_with_team do
  		after_create do |project|
  			create(:team, project: project)
  		end
  	end

  	factory :project_with_task do
  		after_create do |project|
  			create(:task, project: project)
  		end
  	end
  end

  factory :team do
  	body 'Judy Smith'
  end

  factory :task do
  	body 'Clean up Kitchen'
  end
end
