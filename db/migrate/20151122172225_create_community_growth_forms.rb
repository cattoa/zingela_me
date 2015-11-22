class CreateCommunityGrowthForms < ActiveRecord::Migration
  def change
    create_table :community_growth_forms do |t|
      t.string :description
      t.integer :count
      t.float :percentage_cover_mean
      t.float :occurance_mean
      t.float :slope
      t.float :intercept
      t.float :percentage_cover
      t.float :proportional_cover
      t.float :mean_canopy_diameter
      t.float :individuals_per_hectare
      t.float :std_deviation
      t.float :std_error
      t.boolean :has_strong_competitor
      t.boolean :has_normal_competitor
      t.boolean :has_weak_competitor

      t.timestamps null: false
    end
  end
end
