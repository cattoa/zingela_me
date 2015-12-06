class RenameColumnForCommunities < ActiveRecord::Migration
  def change
    rename_column :communities, :desctiption, :description
    remove_column :communities, :name, :string
  end
end
