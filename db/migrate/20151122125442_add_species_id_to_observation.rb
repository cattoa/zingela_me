class AddSpeciesIdToObservation < ActiveRecord::Migration
  def change
    add_column :observations, :species_id, :integer
  end
end
