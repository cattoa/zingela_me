json.array!(@projects) do |project|
  json.extract! project, :id, :name, :start_date, :expected_delivery_date, :actual_delivery_date, :active, :date_changed, :user_id, :company_id
  json.url project_url(project, format: :json)
end
