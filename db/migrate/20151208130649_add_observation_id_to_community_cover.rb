class AddObservationIdToCommunityCover < ActiveRecord::Migration
  def change
    add_column :community_covers, :observation_id, :integer
  end
end
