class Admin::RestaurantsController < Admin::ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

  # GET /admin/restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /admin/restaurants/1
  def show
  end

  # GET /admin/restaurants/new
  def new
    @restaurant = Restaurant.new
    10.times { @restaurant.menu_items.build }
  end

  # GET /admin/restaurants/1/edit
  def edit
    3.times { @restaurant.menu_items.build }
  end

  # POST /admin/restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to [ :admin, @restaurant ], notice: "Restaurant was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/restaurants/1
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to [ :admin, @restaurant ], notice: "Restaurant was successfully updated.", status: :see_other }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/restaurants/1
  def destroy
    @restaurant.destroy!

    respond_to do |format|
      format.html { redirect_to admin_restaurants_path, notice: "Restaurant was successfully destroyed.", status: :see_other }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.expect(restaurant: [ :name, :description, :status, :logo,
        menu_items_attributes: [ [ :id, :name, :description, :price, :category, :available, :_destroy ] ] ])
    end
end
