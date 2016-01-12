json.array!(@field_data) do |field_datum|
  json.(field_datum, :id, :date, :observer, :location, :latitude_degree, :latitude_minutes, :latitude_seconds, :longitude_degree, :longitude_minutes, :longitude_seconds, :habitat_description, :project_id)
  json.observations field_datum.observations do |observation|
    json.(observation, :id, :notes)
      json.species_id observation.species.id
      json.growth_forms observation.growth_forms do |growth_form|
        json.(growth_form, :code)
      end
      json.crown_diameters observation.crown_diameters do |crown_diameter|
        json.(crown_diameter, :code)
      end
      json.plant_covers observation.plant_covers do |plant_cover|
        json.(plant_cover, :code)
      end
  end
end
