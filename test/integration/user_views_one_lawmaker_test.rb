require 'capybara'
require 'test_helper'

class UserViewsOneLawmakerTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
  end

  test 'user views legislator' do
    visit '/'
    click_on("Sign in with Facebook")
    fill_in("name", with: "diana")
    click_on("Search")

    assert current_path, legislators_path
    assert page.has_content? "Diana DeGette"

    click_on("See my news")

    assert current_path, legislator_path
    assert page.has_content? "Positive News"
    assert page.has_contnet? "Negative News"
  end
end
