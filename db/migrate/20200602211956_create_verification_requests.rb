class CreateVerificationRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :verification_requests do |t|
      t.integer :code, null: false
      t.integer :phone, null: false
      t.timestamps
    end

    add_index :verification_requests, :phone, unique: true
  end
end
