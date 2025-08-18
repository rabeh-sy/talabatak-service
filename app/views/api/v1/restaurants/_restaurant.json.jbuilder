json.id restaurant.prefix_id
json.extract! restaurant, :name, :description, :status, :created_at, :updated_at
json.logo restaurant.logo.attached? ? rails_blob_url(restaurant.logo) : nil
json.url api_v1_restaurant_url(restaurant, format: :json)
