class Article
  def self.all(sentiment)
    binding.pry
    response = AlchemyService.new(sentiment)
  end
end
