class CreateEventFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :event_followers do |t|
      t.integer :follower_id
      t.integer :event_id

      t.timestamps
    end
    add_index :event_followers, :follower_id
    add_index :event_followers, :event_id
    add_index :event_followers, [:follower_id, :event_id], unique: true
  end
end
