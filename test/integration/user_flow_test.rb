require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest

	test "home page has proper links" do
		visit '/'
		assert has_content?('Sign up'), 'User needs link to sign up'
		assert has_content?('Log in'), 'User needs a link to Log in'
		assert has_no_content?('Logout'), "User not logged in shouldn't see Logout"
	end 

	test "successful sign up" do
		visit '/'
		click_link('Sign up')
		assert_equal signup_path, current_path, "After clicking sign up, user should be on the new user page"
		user = FactoryGirl.build(:user)
		fill_in "user[first_name]", with: user.first_name
		fill_in "user[last_name]", with: user.last_name
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password
		click_button('Create Account')
		assert has_content?(user.first_name), "For now, I want to see user's email. This test will break in the future"
	end

	test "unsuccessful sign up" do
		user = FactoryGirl.build(:user, email: "")
		visit '/signup'
		click_button('Create Account')
		assert_equal users_path, current_path
		assert has_no_content?('Logged in as:'), "After failed sign in, user should not see #{user.first_name}"
	end

	test "user can add a project after signing up" do
		user = setup_signed_in_user
    assert_equal user_path(user), current_path
    assert has_content?('Upload a picture'), "Signed in user should see a link to upload a photo"	
	end
end
