class Restaurant < ApplicationRecord
  # Add has_prefix_id before associations because it overrides has_many to include prefix ID helpers.
  # NEVER change prefix id, it would make all QR codes unusable!.
  has_prefix_id :res

  has_many :menu_items, inverse_of: :restaurant, dependent: :destroy
  has_many :orders, inverse_of: :restaurant, dependent: :destroy
  has_one_attached :logo

  validates :name, presence: true

  enum :status, { active: 0, inactive: 1 }

  accepts_nested_attributes_for :menu_items, allow_destroy: true,
    reject_if: proc { |attrs| attrs["name"].blank? }
end
