class AddStatusToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status, :string, null: false
    add_index :orders, :status
  end
end
