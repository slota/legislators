class LegislatorsController < ApplicationController
  def index
    @legislators = Legislator.all(params["name"])
  end

  def show
    @articles = Article.all
    # @articles = Article.all(sentiment=nil, params[:id])

    @legislator = params[:id]
  end
end
