class AlchemyService
  attr_reader :connection

  def initialize
    @connection = Excon.new("https://gateway-a.watsonplatform.net")
#     @connection = Faraday.new "https://gateway-a.watsonplatform.net/calls/data/GetNews", :ssl => {
#     :ca_path => "/System/Library/OpenSSL"
# }
    # request['Accept-Encoding'] = 'identity'

  end
  #
  def get_news(sentiment, name)
    JSON.parse(connection.get(path: "/calls/data/GetNews?apikey=#{ENV["ALCHEMY_API_KEY"]}&outputMode=json&start=now-5d&end=now&maxResults=5&return=enriched.url.title,enriched.url.url,enriched.url.publicationDate&q.enriched.url.entities.entity=|text=Diana%20Degette,type=person|&q.enriched.url.docSentiment.type=negative").body)
  end
end
