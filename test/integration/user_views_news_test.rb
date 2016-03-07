require 'capybara'
require 'test_helper'

class UserViewsNewsTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
  end

  test 'user views legislator news' do
    visit '/'
    click_on("Sign in with Facebook")
    fill_in("name", with: "diana")
    click_on("Search")

    assert current_path, legislators_path
    assert page.has_content? "Diana DeGette"

    click_on("Search articles")

    assert current_path, legislator_path("Diana Degette")
    assert page.has_content? "Positive News"
    assert page.has_content? "Negative News"

    click_on("Positive News")

  end
end
