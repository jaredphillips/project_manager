ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here... 
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  Capybara.app = ProjectManager::Application
  
  Capybara.javascript_driver = :webkit

  self.use_transactional_fixtures = false

  teardown do   
    DatabaseCleaner.clean 
    Capybara.reset_sessions! # Forget the browser state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end

  def setup_signed_in_user
    attributes_for_user = FactoryGirl.attributes_for(:user)
    user = FactoryGirl.create(:user, attributes_for_user)
    visit '/login'
    fill_in 'email', with: user.email
    fill_in 'password', with: attributes_for_user[:password]
    click_button 'Log in'
    user
  end
end