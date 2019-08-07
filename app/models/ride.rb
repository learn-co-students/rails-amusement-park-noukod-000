class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if (self.user.tickets > self.attraction.tickets) && (self.user.height > self.attraction.min_height)
      new_ticket = self.user.tickets - self.attraction.tickets
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.update(
      :tickets => new_ticket,
      :happiness => new_happiness,
      :nausea => new_nausea
      )
    elsif self.user.tickets < self.attraction.tickets
          return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
          return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
        return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end
  end


end
