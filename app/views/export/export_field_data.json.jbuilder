json.array! @field_data do |field_datum|
  json.id field_datum.id
  json.date field_datum.date
  json.releve_number field_datum.releve_number
  json.location field_datum.location
  json.latitude_degree field_datum.latitude_degree
  json.latitude_minutes field_datum.latitude_minutes
  json.latitude_seconds field_datum.latitude_seconds
  json.longitude_degree field_datum.longitude_degree
  json.longitude_minutes field_datum.longitude_minutes
  json.longitude_seconds field_datum.longitude_seconds
  json.observer field_datum.observer
  json.scale field_datum.scale
  json.habitat_description field_datum.habitat_description
end
