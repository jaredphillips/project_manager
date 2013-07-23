require 'test_helper'

class TeamFlowTest < ActionDispatch::IntegrationTest

	test "user can create a team" do
		user = setup_signed_in_user
		visit user_path(user)
		click_link('Add Team Members')
		assert has_content?('New Member')
		
	end
end
