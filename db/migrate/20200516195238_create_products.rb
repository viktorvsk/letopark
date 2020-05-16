class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :description, null: false
      t.belongs_to :store, null: false
      t.timestamps
    end

    add_foreign_key :products, :stores
  end
end
