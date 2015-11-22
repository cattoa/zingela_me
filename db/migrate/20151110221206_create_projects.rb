class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date
      t.date :expected_delivery_date
      t.date :actual_delivery_date
      t.boolean :active
      t.date :date_changed
      t.integer :user_id
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
