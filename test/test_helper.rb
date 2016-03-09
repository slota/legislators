require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      'provider' => 'facebook',
      'uid' => '1234',
      'credentials' =>
      {
        'token' => '321'
      },
      'info' =>
      {
        'email' => 'john.slota@gmail.com',
        'first_name' => 'john',
        'last_name' => 'slota',
        'image' => 'https://avatars2.githubusercontent.com/u/12905774?v=3&s=460'
      },
      })
    end

  include Capybara::DSL

  def teardown
    reset_session!
  end
end
