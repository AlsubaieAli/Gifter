class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.integer :user_id
      t.integer :gift_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
