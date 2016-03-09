require 'capybara'
require 'test_helper'

class UserSearchForLegislatorTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
  end

  test 'user searches for legislator' do
    visit '/'
    click_on("Sign in with Facebook")
    fill_in("search_terms", with: "diana")
    within(".name-search") do
      click_on("Search")
    end

    assert current_path, legislators_path
    assert page.has_content? "Diana DeGette"
  end
end
