ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  teardown do 
    DatabaseCleaner.clean
  end
end

DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  Capybara.app = ProjectManager::Application
  # To change the Capybara driver to webkit when wanted
  Capybara.javascript_driver = :webkit

  self.use_transactional_fixtures = false 

  setup do
    reset_email
  end

  # This happens at the end of every test
  teardown do
    DatabaseCleaner.clean       # Erase what we put into the database during the tests
    Capybara.reset_sessions!    # Reset browser session
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end

  # This is a helper method we can call anywhere in the tests
  def setup_signed_in_user
    password = "password"
    user = FactoryGirl.create :user, password: password

    visit '/login'
    fill_in "user_email", with: user.email
    fill_in "user_password", with: password
    click_button "Log in"
    user
  end


  def last_email
    ActionMailer::Base.deliveries.last
  end
 
  def reset_email
    ActionMailer::Base.deliveries = []
  end
end