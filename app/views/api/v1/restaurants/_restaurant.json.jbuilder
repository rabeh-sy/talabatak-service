json.id restaurant.prefix_id
json.extract! restaurant, :name, :description, :status
json.logo restaurant.logo.attached? ? rails_blob_url(restaurant.logo) : nil
json.menu_items restaurant.menu_items do |menu_item|
  json.extract! menu_item, :id, :name, :description, :price, :category, :available
  json.category menu_item.translated_category
end

json.url api_v1_restaurant_url(restaurant, format: :json)
