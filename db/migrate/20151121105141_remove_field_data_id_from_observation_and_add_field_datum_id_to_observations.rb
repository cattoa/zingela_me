class RemoveFieldDataIdFromObservationAndAddFieldDatumIdToObservations < ActiveRecord::Migration
  def change
    remove_column :observations, :field_data_id, :integer
    add_column :observations, :field_datum_id, :integer
  end
end
