require 'rails_helper'

RSpec.describe "Admin::Restaurants", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Restaurant. As you add validations to Restaurant, be sure to
  # adjust the attributes here as well.
  let(:user) { User.create!(email_address: 'test@example.com', password: 'password') }

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  before do
    sign_in_as(user)
  end

  describe "GET /index" do
    it "renders a successful response" do
      Restaurant.create! valid_attributes
      get admin_restaurants_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      restaurant = Restaurant.create! valid_attributes
      get admin_restaurant_url(restaurant)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    context "for a normal user" do
      it "does not render successful response" do
        get new_admin_restaurant_url
        expect(response).not_to be_successful
      end
    end

    context "for a super admin user" do
      let(:user) { User.create!(email_address: 'test@example.com', password: 'password', super_admin: true) }

      it "renders a successful response" do
        get new_admin_restaurant_url
        expect(response).to be_successful
      end
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      restaurant = Restaurant.create! valid_attributes
      get edit_admint_restaurant_url(restaurant)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Restaurant" do
        expect {
          post admin_restaurants_url, params: { restaurant: valid_attributes }
        }.to change(Restaurant, :count).by(1)
      end

      it "redirects to the created restaurant" do
        post admin_restaurants_url, params: { restaurant: valid_attributes }
        expect(response).to redirect_to(restaurant_url(Restaurant.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Restaurant" do
        expect {
          post admin_restaurants_url, params: { restaurant: invalid_attributes }
        }.to change(Restaurant, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post admin_restaurants_url, params: { restaurant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested restaurant" do
        restaurant = Restaurant.create! valid_attributes
        patch admin_restaurant_url(restaurant), params: { restaurant: new_attributes }
        restaurant.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the restaurant" do
        restaurant = Restaurant.create! valid_attributes
        patch admin_restaurant_url(restaurant), params: { restaurant: new_attributes }
        restaurant.reload
        expect(response).to redirect_to(restaurant_url(restaurant))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        restaurant = Restaurant.create! valid_attributes
        patch admin_restaurant_url(restaurant), params: { restaurant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested restaurant" do
      restaurant = Restaurant.create! valid_attributes
      expect {
        delete admin_restaurant_url(restaurant)
      }.to change(Restaurant, :count).by(-1)
    end

    it "redirects to the restaurants list" do
      restaurant = Restaurant.create! valid_attributes
      delete admin_restaurant_url(restaurant)
      expect(response).to redirect_to(admin_restaurants_url)
    end
  end
end
