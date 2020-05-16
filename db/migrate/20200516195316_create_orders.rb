class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, null: false
      t.string :code, null: false
      t.string :comment, null: false
      t.timestamps
    end

    add_foreign_key :orders, :customers
  end
end
