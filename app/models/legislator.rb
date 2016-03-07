class Legislator
  attr_reader :first_name, :last_name, :photo, :party, :email, :state, :chamber, :url, :phone, :twitter

  def self.all(string_name)
    if string_name
      name = capitalize_and_split(string_name)
      response = SunlightFoundationService.new.name_lookup(name)["results"]
      response.map do |legislator|
        Legislator.new(legislator)
      end
    end
  end

  def self.capitalize_and_split(string_name)
    # titleize
    name = string_name.split
    if name[0]
      name[0].capitalize!
    end
    if name[1]
      name[1].capitalize!
    end
    name
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
