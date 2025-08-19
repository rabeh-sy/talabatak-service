class MenuItem < ApplicationRecord
  include TranslateEnum

  belongs_to :restaurant

  enum :category, { food: 0, drink: 1 }
  translate_enum :category
end
