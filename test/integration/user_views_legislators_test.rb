require 'capybara'
require 'test_helper'

class UserViewsLegislatorsTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
  end

  test 'user logging in works as expected' do
    visit '/'
    click_on("Sign in with Facebook")
    assert page.has_content?("john")
  end

  test 'user sees legislators by zip' do
    visit '/legislators'
    within(".zip-search") do
      fill_in("zip", with: "80211")
      click_on("Search")
    end

    assert page.has_content?("Cory Gardner")
  end
end
