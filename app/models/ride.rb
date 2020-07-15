class Ride < ActiveRecord::Base
   belongs_to :user
   belongs_to :attraction

 #if the user has enough tickets, they can ride. if not they get a messsaage
 #if user is tall enough, they can ride. if not, message
def take_ride
   if self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
     "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
   elsif self.user.height < self.attraction.min_height
     "Sorry. You are not tall enough to ride the #{attraction.name}."
   elsif self.user.tickets < self.attraction.tickets
     "Sorry. You do not have enough tickets to ride the #{attraction.name}."
   else
     self.user.tickets -= self.attraction.tickets
     self.user.nausea += self.attraction.nausea_rating
     self.user.happiness += self.attraction.happiness_rating
     user.save
     "Thanks for riding the #{self.attraction.name}!"
   end
 end
end




#  def take_ride
#    dnt_have_enough_ticket = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
#    not_tall_enough = " You are not tall enough to ride the #{attraction.name}."
#    return dnt_have_enough_ticket+not_tall_enough if !good_height && !good_tichket
#    return dnt_have_enough_ticket unless good_tichket
#    return "Sorry.#{not_tall_enough}" unless good_height

#    self.user.update(
#      tickets: user.tickets - attraction.tickets,
#      happiness: user.happiness + attraction.happiness_rating,
#      nausea: user.nausea + attraction.nausea_rating)
#    "Thanks for riding the #{attraction.name}!"
#  end

#  private

#  def good_height
#    user.height >= attraction.min_height
#  end

#  def good_tichket
#    user.tickets >= attraction.tickets
#  end