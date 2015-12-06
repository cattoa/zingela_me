class RemoveUserIdFromFieldData < ActiveRecord::Migration
  def change
    remove_column :field_data, :user_id, :integer
  end
end
