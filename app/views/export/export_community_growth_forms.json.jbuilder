json.array! @community_growth_forms do |cgf|
  json.id cgf.id
  json.description cgf.description
  json.count cgf.count
  json.percentage_cover_mean cgf.percentage_cover_mean
  json.occurance_mean cgf.occurance_mean
  json.slope cgf.slope
  json.intercept cgf.intercept
  json.percentage_cover cgf.percentage_cover
  json.proportional_cover cgf.proportional_cover
  json.mean_canopy_diameter cgf.mean_canopy_diameter
  json.individuals_per_hectare cgf.individuals_per_hectare
  json.std_deviation cgf.std_deviation
  json.std_error cgf.std_error
  json.has_strong_competitor cgf.has_strong_competitor
  json.has_normal_competitor cgf.has_normal_competitor
  json.has_weak_competitor cgf.has_weak_competitor
  json.report_community_id cgf.report_community_id
  json.order cgf.order
end
