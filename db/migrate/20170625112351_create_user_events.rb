class CreateUserEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :user_events do |t|
      t.integer :attendee_id
      t.integer :attending_event_id

      t.timestamps
    end
    add_index :user_events, :attendee_id
    add_index :user_events, :attending_event_id
    add_index :user_events, [:attendee_id, :attending_event_id], unique: true
  end
end
