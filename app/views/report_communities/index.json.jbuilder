json.array!(@report_communities) do |report_community|
  json.extract! report_community, :id, :percentage_cover, :mean_canopy_diameter, :individuals_per_hectare, :community_id
  json.url report_community_url(report_community, format: :json)
end
