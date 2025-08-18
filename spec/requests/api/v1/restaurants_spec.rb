require 'rails_helper'

RSpec.describe "Api::V1::Restaurants", type: :request do
  describe "GET /show" do
    it "renders a successful response" do
      restaurant = Restaurant.create!(name: "test restaurant")
      get api_v1_restaurant_url(restaurant), as: :json
      expect(response).to be_successful
    end
  end
end
