class AddProjectIdToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :project_id, :integer
  end
end
