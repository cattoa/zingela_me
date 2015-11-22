class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :notes
      t.integer :field_data_id

      t.timestamps null: false
    end
  end
end
