class RemoveLogitudeSecondsFromObeservatio < ActiveRecord::Migration
  def change
    remove_column :field_data, :longitude_seconds, :integer
    remove_column :field_data, :latitude_seconds, :integer
    add_column :field_data, :longitude_seconds, :float
    add_column :field_data, :latitude_seconds, :float
    end
end
