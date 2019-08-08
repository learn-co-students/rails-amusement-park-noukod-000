class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets && tall_enough
      new_ticket = self.user.tickets - self.attraction.tickets
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.update(:tickets => new_ticket,:happiness => new_happiness,:nausea => new_nausea)
      return "Thanks for riding the #{self.attraction.name}!"
    elsif tall_enough && !enough_tickets
          return "Sorry. " + tickets_issue
    elsif enough_tickets && !tall_enough
          return "Sorry. " + height_issue
    else
          return "Sorry. " + last_issue
    end
  end

  private
  def enough_tickets
    self.user.tickets > self.attraction.tickets
  end

  def tall_enough
    self.user.height > self.attraction.min_height
  end

  def tickets_issue
    return "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_issue
    return "You are not tall enough to ride the #{self.attraction.name}."
  end
  def last_issue
    return tickets_issue + " " + height_issue
  end


end
