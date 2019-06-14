class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, uniqueness: true
    accepts_nested_attributes_for :power
end
