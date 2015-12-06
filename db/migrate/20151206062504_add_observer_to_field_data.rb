class AddObserverToFieldData < ActiveRecord::Migration
  def change
    add_column :field_data, :observer, :string
  end
end
