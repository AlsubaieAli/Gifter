class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :title
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
