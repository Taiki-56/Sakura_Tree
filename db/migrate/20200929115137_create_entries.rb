class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :room_id
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
