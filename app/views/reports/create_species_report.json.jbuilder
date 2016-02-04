json.array! Species.all.each do |species|
  json.species_family_id species.species_family_id
  json.id species.id
  json.name species.name
  json.potential_biomass species.potential_biomass
  json.species species.species
  json.threat_status species.threat_status
  json.sa_endemic species.sa_endemic
  json.sysnonym_of species.sysnonym_of
  json.common_name species.common_name
  json.life_cycle species.life_cycle
  json.growth_forms species.growth_forms
  json.min_hieght species.min_hieght
  json.max_height species.max_height
  json.min_altitude species.min_altitude
  json.max_altitude species.max_altitude
  json.distribution species.distribution
end
