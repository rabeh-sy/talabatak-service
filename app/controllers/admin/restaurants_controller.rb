class Admin::RestaurantsController < Admin::ApplicationController
  before_action :set_restaurant, only: %i[ edit update destroy ]

  # GET /admin/restaurants
  def index
    @restaurants = policy_scope([ :admin, Restaurant ])
  end

  # GET /admin/restaurants/1
  def show
    # ids are masked by prefix_id to make restaurant pages unguessable.
    @restaurant = policy_scope([ :admin, Restaurant ]).includes(:menu_items).find_by_prefix_id(params[:id])
  end

  # GET /admin/restaurants/new
  def new
    authorize([ :admin, :restaurant ])
    @restaurant = Restaurant.new
    10.times { @restaurant.menu_items.build }
  end

  # GET /admin/restaurants/1/edit
  def edit
    authorize([ :admin, @restaurant ])
    3.times { @restaurant.menu_items.build }
  end

  # POST /admin/restaurants
  def create
    authorize([ :admin, Restaurant ])
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
    authorize([ :admin, @restaurant ])
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
    authorize([ :admin, @restaurant ])
    @restaurant.destroy!

    respond_to do |format|
      format.html { redirect_to admin_restaurants_path, notice: "Restaurant was successfully destroyed.", status: :see_other }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find_by_prefix_id(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.expect(restaurant: [ :name, :description, :status, :logo, :primary_field, :secondary_field,
        :view_mode, :theme_color,
        menu_items_attributes: [ [ :id, :name, :description, :price, :category, :available, :image, :_destroy ] ] ])
    end
end
