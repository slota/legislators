require 'capybara'
require 'test_helper'

class SunlightServiceTest < ActionDispatch::IntegrationTest

  test 'sunlight service test' do
    VCR.use_cassette('sunlight_service') do
      sunlight_service = SunlightFoundationService.new

      assert_equal sunlight_service.connection.headers, {"User-Agent"=>"Faraday v0.9.2"}

      assert_equal sunlight_service.query("coffman")["results"].first["birthday"], "1955-03-19"
      assert_equal sunlight_service.query("coffman")["results"].first["first_name"], "Mike"

      assert_equal sunlight_service.zip("80401")["results"].first["birthday"], "1975-05-12"
      assert_equal sunlight_service.zip("80401")["results"].first["first_name"], "Jared"

    end
  end
end
