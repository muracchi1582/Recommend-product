class AddCustomerIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :customer_id, :string
    add_column :users, :card_id, :string
  end
end
