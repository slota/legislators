class SunlightFoundationService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://openstates.org/api/v1/")
  end

  def geo_lookup
    JSON.parse(connection.get("legislators/geo/?lat=39.7698122&long=-105.0148322&apikey=#{ENV["SUNLIGHT_API_KEY"]}").body)
  end
end
