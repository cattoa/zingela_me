class AddCommunityToFieldData < ActiveRecord::Migration
  def change
    add_column :field_data, :community_id, :integer
  end
end
