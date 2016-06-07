class StallsController < ApplicationController

  def index
    @stalls = Stall.all
  end

  def new
    @stall = Stall.new
  end

  def create
    Stall.create(stall_params)
    redirect_to '/stalls'
  end

  def show
    @stall = Stall.find(params[:id])
  end

  private
  def stall_params
    params.require(:stall).permit(:name, :description, :address)
  end
end
