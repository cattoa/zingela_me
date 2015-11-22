json.array!(@species) do |species|
  json.extract! species, :id, :name, :potential_biomass, :species, :threat_status, :sa_endemic, :sysnonym_of, :common_name, :life_cycle, :growth_forms, :min_hieght, :max_height, :min_altitude, :max_altitude, :distribution
  json.url species_url(species, format: :json)
end
