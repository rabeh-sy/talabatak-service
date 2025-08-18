require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it "is invalid without a name" do
    restaurant = Restaurant.create({ name: "" })
    expect(restaurant.errors).not_to be_empty
  end
end
