class CreateUsers < ActiveRecord::Migration
  def up 
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :second_name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.timestamps null: false
    end
  end
  def down
    drop_table :users 
  end
end
