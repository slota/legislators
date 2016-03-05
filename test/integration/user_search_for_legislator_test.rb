require 'capybara'
require 'test_helper'

class UserSearchForLegislatorTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
  end

  test 'user searches for legislator' do
    visit '/'
    click_on("Login")
    fill_in("legislator", with: "diana")
    click_on("Submit")

    assert current_path, legislators_path
    assert page.has_content? "Diana Degette"
  end
end
