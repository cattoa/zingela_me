class AddScaleAndRelveNumberToFieldData < ActiveRecord::Migration
  def change
    add_column :field_data, :scale, :string
    add_column :field_data, :releve_number, :integer
  end
end
