require 'capybara'
require 'test_helper'

class UserViewsOneLawmakerTest < ActionDispatch::IntegrationTest
  def setup
    stub_omniauth
  end

  test 'user views presidents_path' do
    visit '/'
    click_on("Search by Presidential Nominees")

    assert_equal current_path, presidents_path
  end

  test 'user views legislators path' do
    visit '/'
    click_on("Search by Legislators")

    assert_equal current_path, legislators_path
  end

  test 'user views legislators nav' do
    visit '/'
    click_on("Legislators")

    assert_equal current_path, legislators_path
  end

  test 'user views presidents nav' do
    visit '/'
    click_on("Presidential Nominees")

    assert_equal current_path, presidents_path
  end
end
