class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    conditions = ["height", "nausea", "happiness", "tickets"]
    conditions.each{|c| eval "return riding_errors(c) if (user.#{c} - attraction.#{/\A(\w)*(#{c})(\w)*\z/} >= 0)" }
    # (user.tickets - attraction.tickets >= 0) ? ((user.height - attraction.height >= 0) ? "" : "Sorry. You are not tall enough to ride the #{attraction.name}.") : "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end

  private

  def riding_errors condition
    case condition
    when "height"
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    when "tickets"
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    when "nausea"
      ""
    when "happiness"
      ""
    end

  end
end
