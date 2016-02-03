json.array! @project_data do |project_datum|
  json.id project_datum.id
  json.name project_datum.name
  json.start_date project_datum.start_date
  json.expected_delivery_date project_datum.expected_delivery_date
  json.actual_delivery_date project_datum.actual_delivery_date
  json.active project_datum.active
  json.date_changed project_datum.date_changed
  json.user_id project_datum.user_id
  json.company_id project_datum.company_id
end
