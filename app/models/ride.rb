class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    conditions = ["tickets", "height"]
    methods = Attraction.attribute_names
    # raise riding_errors("tickets")
    # raise conditions.map{|c|  return "user.#{c} - attraction.#{methods.select{|m| m[/\A(\w)*(#{c})(\w)*\z/]}.first}" if eval "(user.#{c} - attraction.#{methods.select{|m| m[/\A(\w)*(#{c})(\w)*\z/]}.first})" }.first
    "Sorry. #{conditions.select{|c| c if eval "(user.#{c} - attraction.#{methods.select{|m| m[/\A(\w)*(#{c})(\w)*\z/]}.first} < 0)" }.map { |e| user.update_userstate(attraction); riding_errors(e); }.join(" ")}"

    # errors.map { |e| riding_errors(e)  }.join(" ")
    # raise errors.inspect
    # (user.tickets - attraction.tickets >= 0) ? ((user.height - attraction.height >= 0) ? "" : "Sorry. You are not tall enough to ride the #{attraction.name}.") : "Sorry. You do not have enough tickets to ride the #{attraction.name}."
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
