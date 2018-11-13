class AddColumnToGifts < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :reserve_id, :integer
  end
end
