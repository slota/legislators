class SunlightFoundationService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://congress.api.sunlightfoundation.com/")
  end

  def name_lookup(name)
    JSON.parse(connection.get("legislators?query=#{name}&apikey=#{ENV["SUNLIGHT_API_KEY"]}").body)
  end
end
