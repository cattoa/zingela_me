json.array! @communities do |community|
  json.id community.id
  json.description community.description
  json.project_id community.project_id
end
