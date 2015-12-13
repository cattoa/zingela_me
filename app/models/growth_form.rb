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
    when 'D'
      description = 'Dwarf Shrubs'
    when 'F'
      description = 'Forbs'
    when 'T'
      description = 'Trees'
    when 'S'
      description = 'Shrubs'
    else
      puts "issue"
    end
    last_item.update_column(:description,description )
  end
end
