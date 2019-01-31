class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    puts self.attraction.inspect
    puts self.user.inspect
    if self.attraction.tickets > self.user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end

    if user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end
end
