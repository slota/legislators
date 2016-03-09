require 'capybara'
require 'test_helper'

class UserLogsOutTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
  end

  test 'user logging in works as expected' do
    visit '/'
    click_on("Sign in with Facebook")
    assert page.has_content?("john")
    
    click_on("Sign Out")
    refute page.has_content?("john")
  end

end
