class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def update_userstate(attraction)
    self.tickets = self.tickets - attraction.tickets
    puts self.tickets.to_s
    self.save
    # self.nausea = self.nausea + attraction.nausea_rating
    # self.happiness = self.happiness + attraction.happiness_rating
  end

  def mood
    happiness-nausea >= 0 ? "happy" : "sad"
  end
end
