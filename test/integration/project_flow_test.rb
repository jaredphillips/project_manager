require 'test_helper'

class ProjectFlowTest < ActionDispatch::IntegrationTest

	test "signed in user can create a basic project" do
		user = setup_signed_in_user
		assert has_link?('Create a new project!'), "Create a new project! button should be on users home page"
		click_link('Create a new project!')
		assert_equal new_user_project_path(user), current_path, "User should be on create a project page"
		assert has_content?('Title: '), "Project needs to have a title"
		assert has_content?('Objective: '), "Project needs to have a objective"
		assert has_selector?('.date_field'), "Project needs to have a due date button"
		assert has_selector?('.action'), "Project needs to have a get started button"
	end
end
