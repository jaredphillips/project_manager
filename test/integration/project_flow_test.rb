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

	test "after creating a project, it displays on users page" do
		user = setup_signed_in_user
		click_link('Create a new project!')
		project = FactoryGirl.build(:project)
		fill_in "project[title]", with: project.title
	 	fill_in "project[objective]", with: project.objective
	  fill_in "project[due_date]", with: project.due_date
    click_button "Get Started"
		assert_equal user_path(user), current_path, "After creating a project, user should be on the user path, not projects path"
		assert has_content?('First Project Title'), "User should see project title just created listed on user page"
	end
end
