class GrowthForm < ActiveRecord::Base
  belongs_to :observation
  after_create do
    update_info(id)
  end
  after_update do
    update_info(id)
  end
  def update_info(id)
    last_item = GrowthForm.find(id)
    case last_item.code
    when 'G'
      description = 'Grasses'
      order = 2
    when 'D'
      description = 'Dwarf Shrubs'
      order = 0
    when 'F'
      description = 'Forbs'
      order = 1
    when 'T'
      description = 'Trees'
      order = 4
    when 'S'
      description = 'Shrubs'
      order = 3
    else
      puts "issue"
    end
    last_item.update_column(:description,description )
    last_item.update_column(:order,order )
  end
end
