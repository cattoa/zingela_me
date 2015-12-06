json.array!(@communities) do |community|
  json.extract! community, :id, :description
  json.url community_url(community, format: :json)
end
