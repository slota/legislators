class LegislatorsController < ApplicationController
  def index
    @legislators = Legislator.all(params["name"])
  end

  def show
    if params[:format]
      @articles = Article.all(params[:format], params[:id])
    end
    @legislator = params[:id]
  end
end
