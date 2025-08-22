class TelegramNotificationJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find(order_id)
    restaurant = order.restaurant
    return if restaurant.telegram_chat_id.blank?

    message = order.summary

    TelegramNotifier.new.send_message(restaurant.telegram_chat_id, message)
  end
end
