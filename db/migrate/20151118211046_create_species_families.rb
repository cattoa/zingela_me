class CreateSpeciesFamilies < ActiveRecord::Migration
  def change
    create_table :species_families do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
