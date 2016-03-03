require 'capybara'
require 'test_helper'

class UserViewsLegislatorsTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
  end

  test 'user logging in works as expected' do
    visit '/'
    click_on("Login")
    assert page.has_content?("john")
    assert page.has_content? "Daniel Pabon"
    assert page.has_content? "Lucia Guzman"
  end
end
