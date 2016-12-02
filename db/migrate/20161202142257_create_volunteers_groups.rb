class CreateVolunteersGroups < ActiveRecord::Migration
  def change
    create_table :volunteers_groups do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
