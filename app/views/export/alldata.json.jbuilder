json.array!(@field_data) do |field_datum|
  json.(field_datum, :id, :date, :observer, :location, :latitude_degree, :latitude_minutes, :latitude_seconds, :longitude_degree, :longitude_minutes, :longitude_seconds, :habitat_description, :project_id)
  json.observations field_datum.observations do |observation|
    json.(observation, :id, :notes, :species_id, :growth_forms, :crown_diameters, :plant_covers)
  end
end
