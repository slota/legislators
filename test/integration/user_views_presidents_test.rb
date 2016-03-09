require 'capybara'
require 'test_helper'

class UserViewsLegislatorsTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
    @president1 = President.create(name: "Jerry Lewis", image: "dope", url: "kewl_story.com")
    @president2 = President.create(name: "Randy Marsh", image: "jobs", url: "south_story.com")

  end

  test 'user views presidents' do
    visit '/presidents'

    assert page.has_content?("Jerry Lewis")

    assert page.has_content?("Randy Marsh")
  end
end
