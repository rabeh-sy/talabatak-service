class RenameTelegramChannelId < ActiveRecord::Migration[8.0]
  def change
    rename_column :restaurants, :telegram_channel_id, :telegram_chat_id
  end
end
