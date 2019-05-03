class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    conditions = ["tickets", "height"]
    methods = Attraction.attribute_names
    return "Sorry. #{conditions.select{|c|
    c if eval "(user.#{c} - attraction.#{methods.select{|m|
     m[/\A(\w)*(#{c})(\w)*\z/]}.first} < 0)" }.map { |e|
     riding_errors(e) }.join(" ")}" if (user.tickets < attraction.tickets || user.height < attraction.min_height)

    # dnt_have_enough_ticket = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    # not_tall_enough = " You are not tall enough to ride the #{attraction.name}."
    # return dnt_have_enough_ticket+not_tall_enough if !good_height && !good_tichket
    # return dnt_have_enough_ticket unless good_tichket
    # return "Sorry.#{not_tall_enough}" unless good_height


    self.user.update(tickets: user.tickets - attraction.tickets,
                nausea: user.nausea + attraction.nausea_rating,
                happiness: user.happiness + attraction.happiness_rating)
    # raise riding_errors("tickets")
    # raise conditions.map{|c|  return "user.#{c} - attraction.#{methods.select{|m| m[/\A(\w)*(#{c})(\w)*\z/]}.first}" if eval "(user.#{c} - attraction.#{methods.select{|m| m[/\A(\w)*(#{c})(\w)*\z/]}.first})" }.first
    "Thanks for riding the #{attraction.name}!"
  end

  private

  def riding_errors condition
    case (c = condition)
    when "height"
      "You are not tall enough to ride the #{attraction.name}."
    when "tickets"
      "You do not have enough tickets to ride the #{attraction.name}."
    end
  end

  # def update_userstate
  #   user.nausea=
  # end
end
#
