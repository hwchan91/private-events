class AddCreatorIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :creator_id, :integer
    add_index :events, :creator_id
    add_index :events, :created_at
    add_index :events, [:creator_id, :created_at]
  end
end
