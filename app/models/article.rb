class Article
  attr_reader :url, :title
  def self.all(sentiment, name)
    #
    # @articles = Article.new
    name = name.split(" ")
    response = AlchemyService.new.get_news(sentiment, name)["result"]["docs"]
    if response == nil
      response = []
    end
    response.map do |article|
      Article.new(article)
    end
  end

  def initialize(article)
    @title = article["source"]["enriched"]["url"]["title"]
    @url = article["source"]["enriched"]["url"]["url"]
  end
end
