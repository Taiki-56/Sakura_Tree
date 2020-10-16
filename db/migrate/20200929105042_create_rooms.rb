class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :post_id
      t.integer :poster_id
      t.integer :user_id

      t.timestamps
    end
  end
end
