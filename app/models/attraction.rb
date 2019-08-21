class Attraction < ApplicationRecord
    has_many :rides 
    has_many :users, through: :rides 

    def has_name?
        self.name.present?
    end

end
