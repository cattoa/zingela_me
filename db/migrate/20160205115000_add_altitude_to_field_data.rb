class AddAltitudeToFieldData < ActiveRecord::Migration
  def change
    add_column :field_data, :altitude, :integer
  end
end
