class AddObservationsIdToPlantCovers < ActiveRecord::Migration
  def change
    add_column :plant_covers, :observation_id, :integer
  end
end
