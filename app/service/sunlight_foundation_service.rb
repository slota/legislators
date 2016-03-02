class SunlightFoundationService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => "http://openstates.org/api/v1/")
  end
end
