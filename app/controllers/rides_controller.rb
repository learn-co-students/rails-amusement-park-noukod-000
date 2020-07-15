
class RidesController < ApplicationController
  def index
  end

  def create
    @ride=Ride.find(params[:id])

    puts @ride.take_ride

    redirect_to user_path(@ride.user)
  end

  def show
    @ride=Ride.find(params[:id])
  end

  def update
  end


end
