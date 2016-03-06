class AlchemyService
  attr_reader :connection

  def initialize
    binding.pry
    @connection = Excon.new(url: "https://gateway-a.watsonplatform.net/calls/data/GetNews/")
  end

  def get_news(name)
    binding.pry
    Faraday.default_adapter = :excon
    JSON.parse(connection.get("apikey=#{ENV["ALCHEMY_API_KEY"]}&outputMode=json&start=now-7d&end=now&maxResults=25&return=enriched.url.title,enriched.url.url,enriched.url.publicationDate&q.enriched.url.entities.entity=|text=#{name[0]}%20#{name[1]},type=person|&q.enriched.url.docSentiment.type=negative").body)
  end
end
