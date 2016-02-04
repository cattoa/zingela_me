json.array! @companies do |company|
  json.id company.id
  json.email company.email
  json.company_name company.company_name
end
