class RidesController < ApplicationController
  def index
  end

  def create
    puts "I am here!!"
    @ride=Ride.find(params[:id])
    @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  def show
    @ride=Ride.find(params[:id])
  end

  def update
  end


end
