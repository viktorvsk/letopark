class AddAdminUserIdToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :admin_user_id, :integer
    add_index  :stores, :admin_user_id
  end
end
