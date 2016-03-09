require 'capybara'
require 'test_helper'

class AlchemyServiceTest < ActionDispatch::IntegrationTest

  test 'alchemy service test' do
    VCR.use_cassette('alchemy_service') do
      alchemy_service = AlchemyService.new

      assert_equal alchemy_service.connection.data[:headers], {"User-Agent"=>"excon/0.47.0"}

      assert_equal alchemy_service.get_news("positive", "Slota")["result"]["docs"].last["source"]["enriched"]["url"]["title"], "Copa Bridgestone Libertadores: five matches on Wednesday | Conmebol.com"
    end
  end
end
