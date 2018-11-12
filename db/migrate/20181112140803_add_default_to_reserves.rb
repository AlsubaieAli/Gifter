class AddDefaultToReserves < ActiveRecord::Migration[5.2]
  def change
    remove_column :reserves, :confirmed, :boolean
    add_column :reserves, :confirmed, :boolean, default: false
  end
end
