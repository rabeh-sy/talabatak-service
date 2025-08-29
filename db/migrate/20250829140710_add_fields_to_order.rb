class AddFieldsToOrder < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :fields, :json, default: []
    remove_column :orders, :table_number
  end
end
