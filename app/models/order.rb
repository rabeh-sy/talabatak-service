class Order < ApplicationRecord
  belongs_to :restaurant

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :table_number, presence: true
  validates :sequence_number, presence: true

  before_validation :set_sequence_number, on: :create

  private

  def set_sequence_number
    last_sequence = restaurant.orders.maximum(:sequence_number) || 0
    self.sequence_number = last_sequence + 1
  end
end
