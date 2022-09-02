class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev,item_name,value)
        freebie=Freebie.create(item_name: item_name,value:value)
        dev.freebies << Freebie
    end

    def self.earliest
        self.minimum("founding_year")
    end

    def self.oldest_company
        self.where("founding_year=?",self.earliest)
    end
end
