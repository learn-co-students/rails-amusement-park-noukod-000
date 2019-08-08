class RidesController < ApplicationController
  def create
    ride = Ride.new(ride_params)

    if ride.save
        ride.take_ride
        flash[:notice] = "#{ride.take_ride}"
        redirect_to user_path(ride.user)
    else
        flash[:notice] = "#{ride.take_ride}"
        redirect_to user_path(ride.user)
    end
    # if ride.save
    #   redirect_to user_path(ride.user)
    # else
    #   render '/attractions/#{attraction_id}'
    # end
  end

  private
  def ride_params
    params.require(:ride).permit(:user_id,:attraction_id)
  end
end
