class CreateGrowthForms < ActiveRecord::Migration
  def change
    create_table :growth_forms do |t|
      t.integer :observation_id
      t.string :description

      t.timestamps null: false
    end
  end
end
