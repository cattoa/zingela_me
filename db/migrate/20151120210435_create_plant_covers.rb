class CreatePlantCovers < ActiveRecord::Migration
  def change
    create_table :plant_covers do |t|
      t.float :percentage
      t.float :lower_class_limit
      t.float :upper_class_limit
      t.float :class_interval

      t.timestamps null: false
    end
  end
end
