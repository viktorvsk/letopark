class AddStatusToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :status, :string, null: false
    add_index :order_items, :status
  end
end
