class AddCodeToGrowthForms < ActiveRecord::Migration
  def change
    add_column :growth_forms, :code, :string
  end
end
