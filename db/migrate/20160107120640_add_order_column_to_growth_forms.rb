class AddOrderColumnToGrowthForms < ActiveRecord::Migration
  def change
    add_column :growth_forms, :order, :integer
  end
end
