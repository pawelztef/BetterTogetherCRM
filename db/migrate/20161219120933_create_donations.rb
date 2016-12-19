class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :transaction_id
      t.float :amount
      t.references :client

      t.timestamps null: false
    end
  end
end
