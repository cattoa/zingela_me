json.array!(@community_growth_forms) do |community_growth_form|
  json.extract! community_growth_form, :id, :description, :count, :percentage_cover_mean, :occurance_mean, :slope, :intercept, :percentage_cover, :proportional_cover, :mean_canopy_diameter, :individuals_per_hectare, :std_deviation, :std_error, :has_strong_competitor, :has_normal_competitor, :has_weak_competitor
  json.url community_growth_form_url(community_growth_form, format: :json)
end
