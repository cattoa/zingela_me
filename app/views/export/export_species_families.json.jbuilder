json.array! @species_families do |species_family|
  json.id species_family.id
  json.name species_family.name
  json.company_id species_family.company_id
end
