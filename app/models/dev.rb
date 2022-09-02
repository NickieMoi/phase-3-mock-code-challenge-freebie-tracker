class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        (self.freebies.find{|freebie| freebie.item_name== item_name})? true: false
    end

    def give_away(dev,freebie)
        if self.freebies.include?(freebie)
            freebie.update(dev_id: freebie)
        end
    end
end