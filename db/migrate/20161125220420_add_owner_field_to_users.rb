class AddOwnerFieldToUsers < ActiveRecord::Migration
  def up
    add_column :users, :ownership, :boolean, null: false, default: false
  end
  def down
    remove_column :users, :ownership
  end
end
