json.array! @plant_covers do |plant_cover|
  json.id plant_cover.id
  json.code plant_cover.code
  json.upper_class_limit plant_cover.upper_class_limit
  json.lower_class_limit plant_cover.lower_class_limit
  json.class_interval plant_cover.class_interval
end
