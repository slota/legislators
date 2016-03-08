class Legislator
  attr_reader :first_name, :last_name, :photo, :party, :email, :state, :chamber, :url, :phone, :twitter

  def self.all(params)
    if params[:search_terms]
      find_by_name(params[:search_terms])
    elsif params[:zip]
      find_by_zip(params[:zip])
    end
  end

  def self.find_by_name(search_terms)
    search_terms = search_terms.split
    response = search_terms.map do |term|
      SunlightFoundationService.new.query(term)["results"]
    end
    create_legislators(response.uniq.flatten)
  end

  def self.find_by_zip(zip)
    response = SunlightFoundationService.new.zip(zip)["results"]
    create_legislators(response)
  end

  def self.create_legislators(legislators)
    legislators.map do |legislator|
      Legislator.new(legislator)
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
