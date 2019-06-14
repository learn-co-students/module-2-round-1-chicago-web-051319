class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, uniqueness: true
    accepts_nested_attributes_for :power

    def self.search(search_term)
        power = Power.find_by(name: search_term)
        if power
            self.where(power_id: power)
        else
            Heroine.all
        end 
    end
end
