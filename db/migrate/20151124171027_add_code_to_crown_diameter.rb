class AddCodeToCrownDiameter < ActiveRecord::Migration
  def change
    add_column :crown_diameters, :code, :string
  end
end
