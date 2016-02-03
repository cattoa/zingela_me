json.array! @observations do |observation|
  json.id observation.id
  json.species_id observation.species_id
  json.field_datum_id observation.field_datum_id
  json.notes observation.notes
end
