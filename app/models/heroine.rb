class Heroine < ApplicationRecord
  validates :name, :super_name, presence: true
  validates_uniqueness_of :name, :super_name

  def power
    id = self.power_id
    Power.all.find_by(id: id)
  end

end
