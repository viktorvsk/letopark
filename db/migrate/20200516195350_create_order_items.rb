class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, null: false
      t.belongs_to :product
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.timestamps
    end

    add_foreign_key :order_items, :orders
  end
end
