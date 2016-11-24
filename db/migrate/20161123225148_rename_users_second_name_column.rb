class RenameUsersSecondNameColumn < ActiveRecord::Migration
  def up
    rename_column :users, :second_name, :last_name
  end

  def down 
    rename_column :users, :last_name, :second_name
  end
end
