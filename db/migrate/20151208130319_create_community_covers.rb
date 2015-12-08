class CreateCommunityCovers < ActiveRecord::Migration
  def change
    create_table :community_covers do |t|
      t.integer :species_id
      t.float :percentage_cover
      t.float :proportional_cover
      t.integer :count
      t.float :mean_canopy_diameter
      t.float :individual_per_hectare
      t.float :predicted_cover
      t.float :difference
      t.integer :competitor
      t.integer :number_of_communiunities

      t.timestamps null: false
    end
  end
end
