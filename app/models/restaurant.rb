class Restaurant < ApplicationRecord
  validates :name, presence: true

  enum :status, { active: 0, inactive: 1 }
end
