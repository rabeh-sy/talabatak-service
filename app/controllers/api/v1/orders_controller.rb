class Api::V1::OrdersController < Api::V1::ApplicationController
  # POST api/v1/restaurants/1/orders.json
  def create
    restaurant = Restaurant.find_by_prefix_id(params[:restaurant_id])
    order = restaurant.orders.new(order_params)

    if order.save
      render json: order, status: :created
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.expect(order: [ :total, :table_number, details: [ [ :item_id, :name, :price, :quantity ] ], fields: {} ])
  end
end
