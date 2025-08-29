class AddThemeAndCurrencyToRestaurant < ActiveRecord::Migration[8.0]
  def change
    add_column :restaurants, :theme_color, :string, default: "green"
    add_column :restaurants, :currency, :string, default: "syp"
  end
end
