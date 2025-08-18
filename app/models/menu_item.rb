class MenuItem < ApplicationRecord
  belongs_to :restaurant

  enum :category, { food: 0, drink: 1 }
end
