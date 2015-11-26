class AddCodeToPlantCover < ActiveRecord::Migration
  def change
    add_column :plant_covers, :code, :string
  end
end
