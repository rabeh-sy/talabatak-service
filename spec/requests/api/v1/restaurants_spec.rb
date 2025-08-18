require 'rails_helper'

RSpec.describe "Api::V1::Restaurants", type: :request do
  describe "GET /show" do
    it "renders a successful response" do
      restaurant = Restaurant.create!(name: "test restaurant")
      get api_v1_restaurant_url(restaurant), as: :json
      expect(response).to be_successful
    end

    it "returns prefix_id instead of id" do
      restaurant = Restaurant.create!(name: "test restaurant")
      get api_v1_restaurant_url(restaurant), as: :json

      response_json = JSON.parse(response.body)
      expect(response_json["id"]).to start_with("res") # check prefix from model
    end
  end
end
