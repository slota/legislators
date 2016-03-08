class SunlightFoundationService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://congress.api.sunlightfoundation.com/")
  end

  def query(term)
    JSON.parse(connection.get("legislators?query=#{term}&apikey=#{ENV["SUNLIGHT_API_KEY"]}").body)
  end

  def zip(zip)
    JSON.parse(connection.get("legislators/locate?zip=#{zip}&apikey=#{ENV["SUNLIGHT_API_KEY"]}").body)
  end
end
