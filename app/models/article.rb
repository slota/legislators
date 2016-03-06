class Article
  attr_reader :articles, :url, :title
  def self.all
    # (sentiment, name)
    @articles = Article.new
    # name = name.split(" ")
    # response = AlchemyService.new
    # response.get_news(name)
  end

  def initialize
    @title = "This is crazy stuff here!"
    @url = "http://coloradopols.com/diary/81284/saturday-night-vote-ball-open-thread"
  end
end
