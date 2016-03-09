require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'minitest-vcr'
require 'vcr'
require 'webmock'


class ActiveSupport::TestCase
  fixtures :all

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


  def teardown
    reset_session!
  end

  include Capybara::DSL

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end
  MinitestVcr::Spec.configure!
end
