class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.belongs_to :customer, null: false
      t.string :access_token, null: false
      t.string :refresh_token, null: false
      t.timestamps
    end

    add_foreign_key :devices, :customers
  end
end
