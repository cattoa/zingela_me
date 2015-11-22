json.array!(@locations) do |location|
  json.extract! location, :id, :name, :country, :province, :city, :address_1, :address_2
  json.url location_url(location, format: :json)
end
