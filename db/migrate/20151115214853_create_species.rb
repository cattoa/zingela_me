class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name
      t.string :potential_biomass
      t.string :species
      t.string :threat_status
      t.string :sa_endemic
      t.string :sysnonym_of
      t.string :common_name
      t.string :life_cycle
      t.string :growth_forms
      t.string :min_hieght
      t.string :max_height
      t.string :min_altitude
      t.string :max_altitude
      t.string :distribution

      t.timestamps null: false
    end
  end
end
