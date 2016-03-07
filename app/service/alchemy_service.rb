class AlchemyService
  attr_reader :connection

  def initialize
    @connection = Excon.new("https://gateway-a.watsonplatform.net")
  end
  #
  def get_news(sentiment, name)
    JSON.parse(connection.get(path: "/calls/data/GetNews?apikey=#{ENV["ALCHEMY_API_KEY"]}&outputMode=json&start=now-7d&end=now&maxResults=10&return=enriched.url.title,enriched.url.url,enriched.url.publicationDate&q.enriched.url.entities.entity=|text=#{name[0]}%20#{name[1]},type=person|&q.enriched.url.docSentiment.type=#{sentiment}").body)
  end
end
