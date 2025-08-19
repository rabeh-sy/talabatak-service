class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.integer :total, null: false, default: 0
      t.json :details, null: false, default: []
      t.integer :sequence_number, null: false
      t.integer :table_number, null: false

      t.timestamps
    end
  end
end
