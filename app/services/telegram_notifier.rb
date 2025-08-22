require "telegram/bot"

class TelegramNotifier
  def initialize
    @bot = Telegram::Bot::Client.new(Rails.application.credentials.dig(:telegram, :bot_token))
  end

  def send_message(chat_id, text)
    @bot.api.send_message(chat_id: chat_id, text: text)
  end
end
