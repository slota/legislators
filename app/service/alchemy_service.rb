class AlchemyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://access.alchemyapi.com/calls/data/GetNews?apikey=#{ENV["ALCHEMY_API_KEY"]}")
  end

  def get_news(name)
  end
end
