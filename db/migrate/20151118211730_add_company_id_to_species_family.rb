class AddCompanyIdToSpeciesFamily < ActiveRecord::Migration
  def change
    add_column :species_families, :company_id, :integer
  end
end
