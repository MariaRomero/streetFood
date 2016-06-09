class StallsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :owned_post, only: [:edit, :update, :destroy]  
 
  def index
    if (params[:user_location])
      @stalls = Stall.near(params[:user_location], 10)
    else
      @stalls = Stall.all
    end
  end

  def new
    @stall = current_user.stalls.build
  end

  def create

    @stall = current_user.stalls.build(stall_params)
    if @stall.save
      flash[:notice] = "Your stall has been created!"
      redirect_to stalls_path
    else
      flash[:alert] = "Your new stall couldn't be created!  Please check the form."
      render :new
    end    
  end

  def show
    @stall = Stall.find(params[:id])
    @events = @stall.events.all
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
    params.require(:stall).permit(:name, :description, :address,:image,:menu_image, :user_location)
  end

  def owned_post  
    @stall = Stall.find(params[:id])
    unless current_user == @stall.user
      flash[:alert] = "That stall doesn't belong to you!"
      redirect_to root_path
    end
  end  
end
