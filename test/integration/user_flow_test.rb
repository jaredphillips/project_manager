require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest

	test "home page has proper links" do
		visit '/'
		assert has_content?('Sign up'), 'User needs link to sign up'
		assert has_content?('Log in'), 'User needs a link to Log in'
		assert has_no_content?('Logout'), "User not logged in shouldn't see Logout"
	end 

	test "user can successful sign up" do
		visit '/'
		click_link('Sign up')
		user = FactoryGirl.build(:user)
		fill_in "user[first_name]", with: user.first_name
		fill_in "user[last_name]", with: user.last_name
		fill_in "user[email]", with: user.email
		fill_in "user[password]", with: user.password
		fill_in "user[password_confirmation]", with: user.password
		find('.create-account').click
		print page.html
		assert has_content?('')
	end

	test "unsuccessful sign up" do
		visit '/signup'
		user = FactoryGirl.build(:user)
		fill_in "user[email]", with: user.email
		click_button('Get Started')
		assert_equal signup_path, current_path
	end

	test "user can add a picture after signing up" do
		user = setup_signed_in_user
		visit user_path(user)
    path = File.join(Rails.root, 'app', 'assets', 'images', "me.jpg")
    attach_file("user[avatar]", path)
    click_button("Upload your image")
    assert_selector('img', count: 1) 
	end
end