require 'test_helper'

class TeamFlowTest < ActionDispatch::IntegrationTest

	def create_team
		user = setup_signed_in_user
  	visit	user_path(user)
  	click_button('Create your team')
  end

  test "user can create a team" do
  	user = setup_signed_in_user
  	visit	user_path(user)
  	assert has_no_content?('Invite Team Members'), "User is seeing Invite Team Members, they haven't created a team"
  	assert has_content?('Create a team'),  "If you haven't created a team, you should see 'Create your team'"
  	click_link('Create a team')
  	assert has_content?('Back to Dashboard'), "User should have a button to get back to dashboard"
  	assert_equal new_user_team_path(user), current_path, "User should also be on the create a team page"
  end

	test "user can invite team members" do
		create_team
		user = setup_signed_in_user
		visit user_path(user)
		create_team
		click_link('Invite Team Members')
		assert has_content?("Invite someone to join your team"), "User should be prompted to invite someone to there team"
		team_member = FactoryGirl.build(:team)
		fill_in 'invitation[recipient_email]', with: "inviteduser@email.com"
		click_button('Invite')
		assert has_content?(user.first_name), "After clicking invite, user should be redirected back to there dashboard"
	end
end


# signup_url = @invitation.generate_token
# 		send_email = InviteMailer.invitation(user, @invitation, signup_url).deliver
# 		assert_equal [team_member.email], email.to
# 		assert_equal "You've been invited to join the team", email.subject