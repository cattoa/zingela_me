class CreateFieldData < ActiveRecord::Migration
  def change
    create_table :field_data do |t|
      t.date :date
      t.integer :location_id
      t.integer :latitude_degree
      t.integer :latitude_minutes
      t.float :latitude_seconds
      t.integer :longitude_degree
      t.integer :longitude_minutes
      t.float :longitude_seconds
      t.string :habitat_description
      t.integer :project_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
