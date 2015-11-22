class AddSpeciesFamilyIdToSpecies < ActiveRecord::Migration
  def change
    add_column :species, :species_family_id, :integer
  end
end
