class Restaurant < ApplicationRecord
  # TODO: increase prefix_id security by using salt
  # https://github.com/excid3/prefixed_ids?tab=readme-ov-file#salt
  has_prefix_id :res

  validates :name, presence: true

  enum :status, { active: 0, inactive: 1 }
end
