require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest

	test "home page has proper links" do
		visit '/'
		assert has_content?('Sign up'), 'User needs link to sign up'
		assert has_content?('Log in'), 'User needs a link to Log in'
		assert has_no_content?('Logout'), "User not logged in shouldn't see Logout"
	end

end
