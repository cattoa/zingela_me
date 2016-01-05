class AddCommunityIdColumnToProjectReports < ActiveRecord::Migration
  def change
    add_column :project_reports, :community_id, :integer
  end
end
