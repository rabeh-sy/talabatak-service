json.id restaurant.prefix_id
json.extract! restaurant, :name, :description, :status, :theme_color
json.logo restaurant.logo.attached? ? rails_blob_url(restaurant.logo) : nil
json.view_mode restaurant.view_mode
json.currency restaurant.currency_text
json.primary_field restaurant.primary_field_metadata
json.secondary_field restaurant.secondary_field_metadata
json.menu_items restaurant.menu_items do |menu_item|
  json.extract! menu_item, :id, :name, :description, :price, :category, :available
  json.category menu_item.category_text
  json.image menu_item.image.attached? ? rails_blob_url(menu_item.image) : nil
end

json.url api_v1_restaurant_url(restaurant, format: :json)
