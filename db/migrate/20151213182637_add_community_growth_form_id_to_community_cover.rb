class AddCommunityGrowthFormIdToCommunityCover < ActiveRecord::Migration
  def change
    add_column :community_covers, :community_growth_form_id, :integer
  end
end
