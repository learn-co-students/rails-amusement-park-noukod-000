class Ride < ActiveRecord::Base
    belongs_to :user 
    belongs_to :attraction

    def check_ids
        ui = self.user_id.to_s
        ui2 = self.attraction_id.to_s
        puts " Your user_id is: " + ui
        puts " Your attraction_id is: " + ui2
    end

    def take_ride
        if !right_height? 
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif !enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif !enough_tickets? && !right_height? 
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        else
            update_attributes
            self.user.update(
                :tickets => update_attributes[0] ,
                :nausea => update_attributes[1] ,
                :happiness => update_attributes[2]
            )
            "Everything Updated"
        end
    end

    def update_attributes
        new_tickets = self.user.tickets + self.attraction.tickets
        new_happiness = self.user.happiness + self.attraction.happiness_rating
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        [new_tickets, new_happiness, new_nausea]
    end

    def enough_tickets?
           # self.user.tickets += 10 if self.user.tickets == nil
        self.user.tickets >= self.attraction.tickets
    end

    def right_height?
        #self.user.height += 10 if self.user.height == nil
        self.user.height >= self.attraction.min_height
    end

end
