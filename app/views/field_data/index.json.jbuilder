json.array!(@field_data) do |field_datum|
  json.extract! field_datum, :id, :date, :location_id, :latitude_degree, :latitude_minutes, :latitude_seconds, :longitude_degree, :longitude_minutes, :longitude_seconds, :habitat_description, :project_id, :user_id
  json.url field_datum_url(field_datum, format: :json)
end
