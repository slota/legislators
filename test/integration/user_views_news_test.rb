require 'capybara'
require 'test_helper'

class UserViewsNewsTest < ActionDispatch::IntegrationTest

  test 'user views negative legislator news' do
    VCR.use_cassette('negative_legislator_news') do
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

      click_on("Negative News")

      assert page.has_content? "Returned 8 articles"
      assert page.has_content? "A Song for Donald Trump"
    end
  end

  test 'user views positive legislator news' do
    VCR.use_cassette('positive_legislator_news') do
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

      click_on("Positive News")

      assert page.has_content? "Returned 1 articles"
      assert page.has_content? "DeGette, Sarbanes, talk campaign finance in Denver"
    end
  end
end
