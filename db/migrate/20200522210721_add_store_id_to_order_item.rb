class AddStoreIdToOrderItem < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :store_id, :integer, null: false
    add_index :order_items, :store_id
    add_foreign_key :order_items, :stores
  end
end
