require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  test "find by name" do
    legislator = Legislator.find_by_name("diana")
    assert_equal legislator.first.first_name, "Diana"
  end

  test "find by zip" do
    legislator = Legislator.find_by_zip("80211")
    assert_equal legislator.first.first_name, "Cory"
    assert_equal legislator.count, 3
  end

  test "create_legislator" do
    legislator = Legislator.create_legislators(@legislators)
    assert_equal legislator.first.first_name, "Diana"
  end

  test "new" do
    legislator = Legislator.new(@legislator)

    assert_equal legislator.chamber, "Senate"
    assert_equal legislator.email, "Sen.Gardner@opencongress.org"
    assert_equal legislator.first_name, "Cory"
    assert_equal legislator.last_name, "Gardner"
    assert_equal legislator.party, "R"
    assert_equal legislator.phone, "202-224-5941"
    assert_equal legislator.state, "Colorado"
    assert_equal legislator.twitter, "SenCoryGardner"
    assert_equal legislator.url, "http://www.gardner.senate.gov"
  end

  def setup
    @params_zip = {"utf8"=>"✓",
                    "zip"=>"80211",
                    "commit"=>"Search",
                    "controller"=>"legislators",
                    "action"=>"index"}

    @params_name = {"utf8"=>"✓",
                    "search_terms"=>"diana",
                    "commit"=>"Search",
                    "controller"=>"legislators",
                    "action"=>"index"}
    @search_terms = "diana"

    @legislators = [{"bioguide_id"=>"D000197",
                    "birthday"=>"1957-07-29",
                    "chamber"=>"house",
                    "contact_form"=>"https://degette.house.gov/contact/send-me-an-email/email-me",
                    "crp_id"=>"N00006134",
                    "district"=>1,
                    "facebook_id"=>"110757973488",
                    "fax"=>"202-225-5657",
                    "fec_ids"=>["H6CO01141"],
                    "first_name"=>"Diana",
                    "gender"=>"F",
                    "govtrack_id"=>"400101",
                    "icpsr_id"=>29710,
                    "in_office"=>true,
                    "last_name"=>"DeGette",
                    "middle_name"=>"L.",
                    "name_suffix"=>nil,
                    "nickname"=>nil,
                    "oc_email"=>"Rep.Degette@opencongress.org",
                    "ocd_id"=>"ocd-division/country:us/state:co/cd:1",
                    "office"=>"2368 Rayburn House Office Building",
                    "party"=>"D",
                    "phone"=>"202-225-4431",
                    "state"=>"CO",
                    "state_name"=>"Colorado",
                    "term_end"=>"2017-01-03",
                    "term_start"=>"2015-01-06",
                    "thomas_id"=>"01479",
                    "title"=>"Rep",
                    "twitter_id"=>"RepDianaDeGette",
                    "votesmart_id"=>561,
                    "website"=>"http://degette.house.gov",
                    "youtube_id"=>"RepDianaDeGette"}]

    @legislator = {"bioguide_id"=>"G000562",
                   "birthday"=>"1974-08-22",
                   "chamber"=>"senate",
                   "contact_form"=>nil,
                   "crp_id"=>"N00030780",
                   "district"=>nil,
                   "facebook_id"=>"160924893954206",
                   "fax"=>nil,
                   "fec_ids"=>["H0CO04122", "S4CO00395"],
                   "first_name"=>"Cory",
                   "gender"=>"M",
                   "govtrack_id"=>"412406",
                   "icpsr_id"=>21112,
                   "in_office"=>true,
                   "last_name"=>"Gardner",
                   "lis_id"=>"S377",
                   "middle_name"=>nil,
                   "name_suffix"=>nil,
                   "nickname"=>nil,
                   "oc_email"=>"Sen.Gardner@opencongress.org",
                   "ocd_id"=>"ocd-division/country:us/state:co",
                   "office"=>"354 Russell Senate Office Building",
                   "party"=>"R",
                   "phone"=>"202-224-5941",
                   "senate_class"=>2,
                   "state"=>"CO",
                   "state_name"=>"Colorado",
                   "state_rank"=>"junior",
                   "term_end"=>"2021-01-03",
                   "term_start"=>"2015-01-06",
                   "thomas_id"=>"01998",
                   "title"=>"Sen",
                   "twitter_id"=>"SenCoryGardner",
                   "votesmart_id"=>30004,
                   "website"=>"http://www.gardner.senate.gov",
                   "youtube_id"=>nil}
  end
end
