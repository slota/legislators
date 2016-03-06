class LegislatorsController < ApplicationController
  def index
    @legislators = Legislator.all(params["name"])
  end

  def show
    binding.pry
    @articles = Article.all
    @legislator = params[:id]
  end
end
