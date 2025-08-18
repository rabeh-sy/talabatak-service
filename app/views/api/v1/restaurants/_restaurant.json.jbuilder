json.id restaurant.prefix_id
json.extract! restaurant, :name, :description, :status, :created_at, :updated_at
json.url api_v1_restaurant_url(restaurant, format: :json)
