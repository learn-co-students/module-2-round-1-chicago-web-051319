class AddPowersToHeroines < ActiveRecord::Migration[5.1]
  def change
    add_column :heroines, :powers, :string
  end
end
