class LegislatorsController < ApplicationController
  def index
    @legislators = Legislator.all(params["name"])
  end
end
