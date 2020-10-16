class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :room_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end
end
