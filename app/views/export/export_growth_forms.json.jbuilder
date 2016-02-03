json.array! @growth_forms do |growth_form|
  json.id growth_form.id
  json.observation_id growth_form.observation_id
  json.description growth_form.description
  json.code growth_form.code
  json.order growth_form.order
end
