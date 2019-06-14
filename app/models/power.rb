class Power < ApplicationRecord
  has_many :heroines
  validates_uniqueness_of :name
end
