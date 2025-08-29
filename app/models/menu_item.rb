class MenuItem < ApplicationRecord
  extend Enumerize

  belongs_to :restaurant
  has_one_attached :image

  enumerize :category, in: [ :food, :drinks ]
end
