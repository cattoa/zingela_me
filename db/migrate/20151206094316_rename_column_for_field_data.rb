class RenameColumnForFieldData < ActiveRecord::Migration
  def change
    rename_column :field_data, :location_id, :location
  end
end
