class CreateRainyDays < ActiveRecord::Migration[6.1]
  def change
    create_table :rainy_days do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.timestamps
    end
    add_index :rainy_days, [:user_id, :date], unique: true
  end
end
