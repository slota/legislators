class SunlightFoundationService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "http://congress.api.sunlightfoundation.com/")
  end

  def name_lookup(name)
    JSON.parse(connection.get("legislators?first_name=#{name[0]}&last_name=#{name[1]}&apikey=#{ENV["SUNLIGHT_API_KEY"]}").body)
  end
end
