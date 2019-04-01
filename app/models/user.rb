class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def update_userstate(attraction)
    self.tickets = self.tickets - attraction.tickets
    self.nausea = self.nausea + attraction.nausea_rating
    self.happiness = self.happiness + attraction.happiness_rating
  end
end
