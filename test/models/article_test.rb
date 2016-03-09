require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "find all" do
    articles = Article.all("positive", "diana")

    assert_equal articles.last.title, "Hats off to Biloxi milliner who's reviving a lost art | SunHerald"
    assert_equal articles.last.url, "http://www.sunherald.com/news/business/article64331792.html"
    assert_equal articles.count, 5
  end


  test "new" do
    article = Article.new(@article)
    assert_equal article.title, "ANOHNI enlists Naomi Campbell for 'Drone Bomb Me' video, talks gender identity - watch | NME.COM"
    assert_equal article.url, "http://www.nme.com/news/various-artists/92151"
  end

  def setup
    @article = {"id"=>"MTEzMDYxOTYxMzB8MTQ1NzU1NjgyMA",
                 "source"=>
                  {"enriched"=>
                    {"url"=>
                      {"publicationDate"=>{"confident"=>"no", "date"=>"20160309T000000"},
                       "title"=>
                        "ANOHNI enlists Naomi Campbell for 'Drone Bomb Me' video, talks gender identity - watch | NME.COM",
                       "url"=>"http://www.nme.com/news/various-artists/92151"}}},
                 "timestamp"=>1457556820}
  end
end
