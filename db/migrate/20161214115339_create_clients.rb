class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name, null: false 
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone1, null: false
      t.string :phone2
      t.boolean :institution, null: false, default: false

      t.timestamps null: false
    end
  end
end
