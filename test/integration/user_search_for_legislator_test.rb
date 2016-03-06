require 'capybara'
require 'test_helper'

class UserSearchForLegislatorTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
  end

  test 'user searches for legislator' do
    visit '/'
    click_on("Sign in with Facebook")
    fill_in("name", with: "diana")
    click_on("Search")

    assert current_path, legislators_path
    assert page.has_content? "Diana DeGette"
  end
end
