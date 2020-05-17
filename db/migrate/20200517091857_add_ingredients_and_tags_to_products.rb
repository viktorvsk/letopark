class AddIngredientsAndTagsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :ingredients, :string
    add_column :products, :tags, :string
  end
end
