require 'test_helper'

class TeamFlowTest < ActionDispatch::IntegrationTest

	test "user can create a team" do
		user = setup_signed_in_user
		visit user_path(user)
		click_link('Add Team Members')
		assert has_content?('New Member')
		team = FactoryGirl.build(:team)
		
	end
end

# test "after creating a project, it displays on users page" do
# 		user = setup_signed_in_user
# 		visit user_path(user)
# 		click_link('New Project')
# 		project = FactoryGirl.build(:project)
# 		fill_in "project[title]", with: project.title
# 	 	fill_in "project[objective]", with: project.objective
# 	  fill_in "project[due_date]", with: project.due_date
#     click_button "Get this project started"
# 		assert_equal user_path(user), current_path, "After creating a project, user should be on the user path, not projects path"
# 		assert has_content?('First Project Title'), "User should see project title just created listed on user page"
# 	end
