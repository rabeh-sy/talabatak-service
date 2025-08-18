class Api::V1::RestaurantsController < Api::V1::ApplicationController
  before_action :set_restaurant, only: %i[ show ]

  # GET api/v1/restaurants/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params.expect(:id))
    end
end
