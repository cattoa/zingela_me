class AddOrderColumnToCommunityGrowthForms < ActiveRecord::Migration
  def change
    add_column :community_growth_forms, :order, :integer
  end
end
