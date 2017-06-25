class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :description
      t.string :date

      t.timestamps
    end
  end
end
