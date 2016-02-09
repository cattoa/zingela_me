json.array! @community_covers do |cc|
  json.id cc.id
  json.species_id cc.species_id
  json.count cc.count
  json.predicted_cover cc.predicted_cover
  json.difference cc.difference
  json.percentage_cover cc.percentage_cover
  json.proportional_cover cc.proportional_cover
  json.mean_canopy_diameter cc.mean_canopy_diameter
  json.individual_per_hectare cc.individual_per_hectare
  json.number_of_communiunities cc.number_of_communiunities
  json.observation_id cc.observation_id
  json.competitor cc.competitor
  json.community_growth_form_id cc.community_growth_form_id
end
