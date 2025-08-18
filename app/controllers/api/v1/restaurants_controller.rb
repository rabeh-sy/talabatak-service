class Api::V1::RestaurantsController < Api::V1::ApplicationController
  # GET api/v1/restaurants/1.json
  def show
    # ids are masked by prefix_id to make restaurant pages unguessable.
    @restaurant = Restaurant.includes(:menu_items).find_by_prefix_id(params[:id])
  end
end
