class RemoveCustomerIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :customer_id, :string
    remove_column :users, :card_id, :string
  end
end
