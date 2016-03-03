class Legislator
  attr_reader :full_name, :photo, :party, :email, :state, :chamber, :url, :phone, :occupation

  def self.all
    response = SunlightFoundationService.new.geo_lookup
    response.map do |legislator|
      Legislator.new(legislator)
    end
  end

  def initialize(legislator)
    @full_name = legislator["full_name"]
    @photo = legislator["photo_url"]
    @party = legislator["party"]
    @email = legislator["email"]
    @state = legislator["state"]
    @chamber = legislator["chamber"]
    @url = legislator["url"]
    @phone = legislator["+phone"]
    @occupation = legislator["+occupation"]
  end
end
