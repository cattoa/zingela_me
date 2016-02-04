json.array! @crown_diameters do |crown_diameter|
  json.id crown_diameter.id
  json.observation_id crown_diameter.observation_id
  json.lower_crown_diameter crown_diameter.lower_crown_diameter
  json.upper_crown_diameter crown_diameter.upper_crown_diameter
  json.transect_length crown_diameter.transect_length
  json.code crown_diameter.code
end
