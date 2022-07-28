json.extract! plan, :id, :name, :price, :description, :plan_type, :created_at, :updated_at
json.url plan_url(plan, format: :json)
