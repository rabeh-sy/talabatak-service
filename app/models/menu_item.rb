class MenuItem < ApplicationRecord
  extend Enumerize

  include TranslateEnum

  belongs_to :restaurant

  enumerize :category, in: [ :food, :drinks ]
end
