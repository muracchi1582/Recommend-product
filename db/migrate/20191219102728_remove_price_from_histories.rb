class RemovePriceFromHistories < ActiveRecord::Migration[5.2]
  def up
    remove_column :histories, :price
  end

  def down
    add_column :histories, :price, :integer
  end
end
