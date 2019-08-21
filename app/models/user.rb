class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides 

    def has_name?
        self.name.present?
    end

    def mood 
        if self.nausea && self.happiness
            mood = self.happiness - self.nausea
            mood > 0 ? "happy" : "sad"
        end
    end

    def self.all_users
        self.all.map{|user| user.name}
    end

end
