class PresidentsController < ApplicationController
  def index
    @presidents = President.all.shuffle
  end
end
