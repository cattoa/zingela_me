class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :country
      t.string :province
      t.string :city
      t.string :address_1
      t.string :address_2

      t.timestamps null: false
    end
  end
end
