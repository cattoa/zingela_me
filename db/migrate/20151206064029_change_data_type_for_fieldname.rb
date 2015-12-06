class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def self.up
    change_table :field_data do |t|
      t.change :latitude_seconds, :integer
      t.change :longitude_seconds, :integer
    end
  end
  def self.down
    change_table :field_data do |t|
      t.change :latitude_seconds, :float
      t.change :longitude_seconds, :float
    end
  end
end
