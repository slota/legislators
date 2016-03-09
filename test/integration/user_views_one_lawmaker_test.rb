require 'capybara'
require 'test_helper'

class UserViewsOneLawmakerTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
  end

  test 'user views legislator' do
    visit '/'
    click_on("Sign in with Facebook")
    fill_in("search_terms", with: "diana")

    within(".name-search") do
      click_on("Search")
    end
    
    assert current_path, legislators_path
    assert page.has_content? "Diana DeGette"

    click_on("Search articles")

    assert current_path, legislator_path("Diana Degette")
    assert page.has_content? "Positive News"
    assert page.has_content? "Negative News"
  end
end
