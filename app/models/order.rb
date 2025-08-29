class Order < ApplicationRecord
  belongs_to :restaurant

  # TODO: calculate total, rather than receive it
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sequence_number, presence: true

  before_validation :set_sequence_number, on: :create
  after_create_commit :notify_restaurant

  def summary
    lines = []
    lines << "🔔 طلب جديد ##{sequence_number}"

    lines << "\n🛒 الطلب:"
    details.each do |item|
      lines << "- #{item['name']} × #{item['quantity']}"
    end

    # Show fields if present
    if fields.present?
      lines << "\n📝 التفاصيل:"
      fields.each do |key, value|
        label = I18n.t(
          :"enumerize.restaurant.primary_field.#{key}",
          default: [ :"enumerize.restaurant.secondary_field.#{key}", key.to_s.humanize ]
        )
        lines << "- #{label}: #{value}"
      end
    end

    lines << "\n💰 المجموع: #{total} ل.س"

    lines.join("\n")
  end

  private

  def set_sequence_number
    last_sequence = restaurant.orders.maximum(:sequence_number) || 0
    self.sequence_number = last_sequence + 1
  end

  def notify_restaurant
    TelegramNotificationJob.perform_later(self.id)
  end
end
