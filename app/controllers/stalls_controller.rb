class StallsController < ApplicationController

  def index
    @stalls = Stall.all
  end
end
