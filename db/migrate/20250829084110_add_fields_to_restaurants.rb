class AddFieldsToRestaurants < ActiveRecord::Migration[8.0]
  def up
    add_column :restaurants, :primary_field, :string, default: "table_number"
    add_column :restaurants, :primary_field_shown, :boolean, default: true
    add_column :restaurants, :primary_field_required, :boolean, default: true

    add_column :restaurants, :secondary_field, :string, default: "notes"
    add_column :restaurants, :secondary_field_shown, :boolean, default: false
    add_column :restaurants, :secondary_field_required, :boolean, default: false

    add_column :restaurants, :view_mode, :string, default: "list"

    add_column :restaurants, :status_tmp, :string, default: "active"

    add_column :menu_items, :category_tmp, :string

    execute <<~SQL.squish
      UPDATE restaurants
      SET status_tmp =
        CASE status
          WHEN 0 THEN 'active'
          WHEN 1 THEN 'inactive'
        END
    SQL

    execute <<~SQL.squish
      UPDATE menu_items
      SET category_tmp =
        CASE category
          WHEN 0 THEN 'food'
          WHEN 1 THEN 'drinks'
        END
    SQL

    remove_column :restaurants, :status
    rename_column :restaurants, :status_tmp, :status

    remove_column :menu_items, :category
    rename_column :menu_items, :category_tmp, :category
  end

  def down
    remove_column :restaurants, :primary_field
    remove_column :restaurants, :primary_field_shown
    remove_column :restaurants, :primary_field_required

    remove_column :restaurants, :secondary_field
    remove_column :restaurants, :secondary_field_shown
    remove_column :restaurants, :secondary_field_required

    remove_column :restaurants, :view_mode

    add_column :restaurants, :status_tmp, :integer

    add_column :menu_items, :category_tmp, :integer, default: 0

    execute <<~SQL.squish
      UPDATE restaurants
      SET status_tmp =
        CASE status
          WHEN 'active' THEN 0
          WHEN 'inactive' THEN 1
        END
    SQL

    execute <<~SQL.squish
      UPDATE menu_items
      SET category_tmp =
        CASE category
          WHEN 'food' THEN 0
          WHEN 'drinks' THEN 1
        END
    SQL

    remove_column :restaurants, :status
    rename_column :restaurants, :status_tmp, :status

    remove_column :menu_items, :category
    rename_column :menu_items, :category_tmp, :category
  end
end
