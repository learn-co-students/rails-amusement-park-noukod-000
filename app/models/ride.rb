class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    conditions = ["height", "tickets", "nausea", "happiness"]
    methods = Attraction.attribute_names
    # raise riding_errors("tickets")
    raise conditions.map{|c|  return "user.#{c} - attraction.#{methods.select{|m| m[/\A(\w)*(#{c})(\w)*\z/]}.first}" if eval "(user.#{c} - attraction.#{methods.select{|m| m[/\A(\w)*(#{c})(\w)*\z/]}.first})" }.first
    # conditions.each{|c| return riding_errors(c) if eval "(user.#{c} - attraction.#{methods.select{|m| m[/\A(\w)*(#{c})(\w)*\z/]}.first} >= 0)" }
    # (user.tickets - attraction.tickets >= 0) ? ((user.height - attraction.height >= 0) ? "" : "Sorry. You are not tall enough to ride the #{attraction.name}.") : "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end

  private

  def riding_errors condition
    case condition
    when "height"
      "Sorry. You are not tall enough to ride the #{attraction.name}. #{condition}"
    when "tickets"
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    when "nausea"
      ""
    when "happiness"
      ""
    end

  end
end
#
