class AddUserToRestaurant < ActiveRecord::Migration[8.0]
  def change
    add_reference :restaurants, :user, null: true, foreign_key: true

    reversible do |dir|
      dir.up do
        user = User.first || User.create!(email_address: "admin@rabeh.sy", password: "123456789")
        Restaurant.update_all(user_id: user.id)

        change_column_null :restaurants, :user_id, false
      end
    end
  end
end
