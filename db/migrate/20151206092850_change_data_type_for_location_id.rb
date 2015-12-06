class ChangeDataTypeForLocationId < ActiveRecord::Migration
  def self.up
    change_table :field_data do |t|
      t.change :location_id, :string
    end
  end
  def self.down
    change_table :field_data do |t|
      t.change :location_id, :integer
    end
  end
end
