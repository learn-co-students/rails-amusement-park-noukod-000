class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    #puts self.attraction.inspect
    #puts self.user.inspect
    if self.attraction.tickets > self.user.tickets
      if user.height < attraction.min_height
        return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      end
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
    if user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    user.tickets-=attraction.tickets
    user.nausea+=attraction.nausea_rating
    user.happiness+=attraction.happiness_rating
    user.save
    return "Thanks for riding the #{self.attraction.name}!"
  end
end
