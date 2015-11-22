class AddReportsCommunityIdToCommunityGrowthForm < ActiveRecord::Migration
  def change
    add_column :community_growth_forms, :report_community_id, :integer
  end
end
