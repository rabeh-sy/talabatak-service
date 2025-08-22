class AddTelegramChannelIdToRestaurants < ActiveRecord::Migration[8.0]
  def change
    add_column :restaurants, :telegram_channel_id, :string
  end
end
