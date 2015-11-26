class CrownDiameter < ActiveRecord::Base
  belongs_to :observation
  after_create do
    update_info(id)
  end
  after_update do
    update_info(id)
  end
  def update_info(id)
    last_item = CrownDiameter.find(id)
    case last_item.code
    when 'G'
      lower_crown_diameter ='0.131'
      upper_crown_diameter = '0.21'
      transect_length = '5.1'
    when 'K'
      lower_crown_diameter = '0.891'
      upper_crown_diameter = '1.44'
      transect_length= '34.95'
    when 'O'
      lower_crown_diameter = '6.101'
      upper_crown_diameter = '9.87'
      transect_length= '239.55'
    when 'A'
      lower_crown_diameter = '0.001'
      upper_crown_diameter = '0.01'
      transect_length= '0.15'
    when 'N'
      lower_crown_diameter = '3.771'
      upper_crown_diameter = '6.1'
      transect_length= '148.05'
    when 'L'
      lower_crown_diameter = '1.441'
      upper_crown_diameter = '2.33'
      transect_length= '56.55'
    when 'J'
      lower_crown_diameter = '0.551'
      upper_crown_diameter = '0.89'
      transect_length= '21.6'
    when 'I'
      lower_crown_diameter = '0.341'
      upper_crown_diameter = '0.55'
      transect_length= '13.35'
	  when 'C'
      lower_crown_diameter = '0.021'
      upper_crown_diameter = '0.03'
      transect_length= '0.75'
	  when 'B'
      lower_crown_diameter = '0.011'
      upper_crown_diameter = '0.02'
      transect_length= '0.45'
	  when 'H'
      lower_crown_diameter = '0.211'
      upper_crown_diameter = '0.34'
      transect_length= '8.25'
	  when 'M'
      lower_crown_diameter = '2.331'
      upper_crown_diameter = '3.77'
      transect_length= '91.5'
	  when 'D'
      lower_crown_diameter = '0.031'
      upper_crown_diameter = '0.05'
      transect_length= '1.2'
	  when 'E'
      lower_crown_diameter = '0.051'
      upper_crown_diameter = '0.08'
      transect_length= '1.95'
	  when 'F'
      lower_crown_diameter = '0.081'
      upper_crown_diameter = '0.13'
      transect_length= '3.15'
    else
      puts "issue"
    end
    last_item.update_column(:lower_crown_diameter,lower_crown_diameter )
    last_item.update_column(:upper_crown_diameter, upper_crown_diameter)
    last_item.update_column(:transect_length,transect_length )
  end
end
