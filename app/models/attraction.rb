class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides

  def users_count
    self.users.count;
  end
end
