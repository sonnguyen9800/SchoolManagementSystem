ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:coordinator_id].nil?
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(coordinator, remember_me: '1')
    post login_path, params: { session: { email: coordinator.email,
                                          password: coordinator.password_digest,
                                          remember_me: remember_me } }
  end
end
