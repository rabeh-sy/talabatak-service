json.extract! restaurant, :id, :name, :description, :status, :created_at, :updated_at
json.url api_v1_restaurant_url(restaurant, format: :json)
