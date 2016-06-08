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

  def edit
    @stall = Stall.find(params[:id])
  end

  def update
    @stall = Stall.find(params[:id])
    @stall.update(stall_params)
    redirect_to '/stalls'
  end

  def destroy
    @stall = Stall.find(params[:id])
    @stall.destroy
    flash[:notice] = 'Stall deleted successfully'
    redirect_to '/stalls'
 end

  private
  def stall_params
    params.require(:stall).permit(:name, :description, :address,:image,:menu_image)
  end
end
