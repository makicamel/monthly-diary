class CreateStarryDays < ActiveRecord::Migration[6.1]
  def change
    create_table :starry_days do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.timestamps
    end
    add_index :starry_days, [:user_id, :date], unique: true
  end
end
