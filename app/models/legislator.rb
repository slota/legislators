class Legislator
  attr_reader :first_name, :last_name, :photo, :party, :email, :state, :chamber, :url, :phone, :twitter

  def self.all(string_name)
    if string_name
      search_terms = string_name.split
      response = search_terms.map do |term|
        SunlightFoundationService.new.name_lookup(term)["results"]
      end
      response.uniq.flatten.map do |legislator|
        Legislator.new(legislator)
      end
    end
  end

  def initialize(legislator)
    @first_name = legislator["first_name"]
    @last_name = legislator["last_name"]
    @party = legislator["party"]
    @email = legislator["oc_email"]
    @state = legislator["state_name"]
    @chamber = legislator["chamber"].capitalize
    @url = legislator["website"]
    @phone = legislator["phone"]
    @twitter = legislator["twitter_id"]
  end
end
