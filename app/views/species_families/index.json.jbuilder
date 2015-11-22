json.array!(@species_families) do |species_family|
  json.extract! species_family, :id, :name
  json.url species_family_url(species_family, format: :json)
end
