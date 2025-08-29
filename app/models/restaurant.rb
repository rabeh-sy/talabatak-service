class Restaurant < ApplicationRecord
  extend Enumerize

  RESTAURANT_CLIENT_URL = "https://qr.rabeh.sy/restaurants"
  # Add has_prefix_id before associations because it overrides has_many to include prefix ID helpers.
  # NEVER change prefix id, it would make all QR codes unusable!.
  has_prefix_id :res

  has_many :menu_items, inverse_of: :restaurant, dependent: :destroy
  has_many :orders, inverse_of: :restaurant, dependent: :destroy
  has_one_attached :logo
  belongs_to :user, optional: true

  validates :name, presence: true

  enumerize :status, in: [ :active, :inactive ], default: :active
  enumerize :primary_field, in: [ :table_number, :email, :phone_number ], scope: true
  enumerize :secondary_field, in: [ :notes ], scope: true
  enumerize :theme_color, in: [ :green, :blue, :red, :yellow, :black ], default: :green
  enumerize :currency, in: [ :syp, :usd, :tl ], default: :syp
  enumerize :view_mode, in: [ :list, :cards ], default: :list

  def primary_field_metadata
    field_metadata(:primary_field)
  end

  def secondary_field_metadata
    field_metadata(:secondary_field)
  end

  accepts_nested_attributes_for :menu_items, allow_destroy: true,
    reject_if: proc { |attrs| attrs["name"].blank? }

  def qr_code
    RQRCode::QRCode.new("#{RESTAURANT_CLIENT_URL}/#{prefix_id}").as_png(
      size: 400
    )
  end

  private

  def field_metadata(field_name)
    key = public_send(field_name)
    return nil unless key

    {
      name: key,
      label: I18n.t("enumerize.restaurant.#{field_name}.#{key}"),
      type: I18n.t("enumerize.fields.#{key}.type"),
      placeholder: I18n.t("enumerize.fields.#{key}.placeholder"),
      shown: public_send("#{field_name}_shown"),
      required: public_send("#{field_name}_required")
    }
  end
end
