require 'test_helper'

class ProjectFlowTest < ActionDispatch::IntegrationTest

	test "signed in user can create a project" do
		setup_signed_in_user
		assert has_link?('Create a new project!'), "Create a new project! button should be on page!"
		click_link 'Create a new project!'
		# assert_project
	end
end
