require "rails_helper"

RSpec.describe Admin::RestaurantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/restaurants").to route_to("admin/restaurants#index")
    end

    it "routes to #new" do
      expect(get: "/admin/restaurants/new").to route_to("admin/restaurants#new")
    end

    it "routes to #show" do
      expect(get: "/admin/restaurants/1").to route_to("admin/restaurants#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/restaurants/1/edit").to route_to("admin/restaurants#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/restaurants").to route_to("admin/restaurants#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/restaurants/1").to route_to("admin/restaurants#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/restaurants/1").to route_to("admin/restaurants#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/restaurants/1").to route_to("admin/restaurants#destroy", id: "1")
    end
  end
end
