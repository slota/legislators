class Article
  def self.all(sentiment, name)
    name = name.split(" ")
    response = AlchemyService.new
    response.get_news(name)
  end
end
