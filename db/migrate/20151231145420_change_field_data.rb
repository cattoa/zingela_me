class ChangeFieldData < ActiveRecord::Migration
  def change
    remove_column :field_data, :longitude_minutes, :integer
    remove_column :field_data, :latitude_minutes, :integer
    add_column :field_data, :latitude_minutes, :float
    add_column :field_data, :longitude_minutes, :float
  end
end
