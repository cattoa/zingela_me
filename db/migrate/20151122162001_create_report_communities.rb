class CreateReportCommunities < ActiveRecord::Migration
  def change
    create_table :report_communities do |t|
      t.float :percentage_cover
      t.float :mean_canopy_diameter
      t.float :individuals_per_hectare
      t.belongs_to :community, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
