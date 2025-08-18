class Restaurant < ApplicationRecord
  # TODO: increase prefix_id security by using salt, and use find_by_prefix_id
  # https://github.com/excid3/prefixed_ids?tab=readme-ov-file#query-by-prefixed-id
  # https://github.com/excid3/prefixed_ids?tab=readme-ov-file#salt
  # Add has_prefix_id before associations because it overrides has_many to include prefix ID helpers.
  has_prefix_id :res

  has_one_attached :logo

  validates :name, presence: true

  enum :status, { active: 0, inactive: 1 }
end
