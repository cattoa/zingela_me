class CreateFlotData < ActiveRecord::Migration
  def change
    create_table :flot_data do |t|
      t.string    :label
      t.integer   :xaxis
      t.integer    :yaxis
    end
  end
end
