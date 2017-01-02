class CreateDonators < ActiveRecord::Migration
  def change
    create_table :donators do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone1
      t.string :phone2
      t.boolean :institution

      t.timestamps null: false
    end
  end
end
