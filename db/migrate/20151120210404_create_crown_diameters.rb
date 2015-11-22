class CreateCrownDiameters < ActiveRecord::Migration
  def change
    create_table :crown_diameters do |t|
      t.integer :observation_id
      t.string :lower_crown_diameter
      t.string :upper_crown_diameter
      t.float :transect_length

      t.timestamps null: false
    end
  end
end
