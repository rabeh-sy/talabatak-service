require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it "is invalid without a name" do
    restaurant = Restaurant.create({ name: "" })
    expect(restaurant.errors).not_to be_empty
  end

  it "has status, with default of active" do
    restaurant = Restaurant.create({ name: "Test Restaurant" })
    expect(restaurant.status).to eq("active")
  end

  it "has prefix id" do
    restaurant = Restaurant.create({ name: "Test Restaurant" })
    prefix_id = restaurant.prefix_id
    expect(prefix_id).to be_present
  end

  it "is searchable by prefix_id" do
    restaurant = Restaurant.create({ name: "Test Restaurant" })
    prefix_id = restaurant.prefix_id

    found_restaurant = Restaurant.find(prefix_id)
    expect(found_restaurant).to match(found_restaurant)
  end
end
