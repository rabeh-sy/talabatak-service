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
  json.image_url "https://images.unsplash.com/photo-1680990999782-ba7fe26e4d0b?q=80&w=1910&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
end

json.url api_v1_restaurant_url(restaurant, format: :json)
