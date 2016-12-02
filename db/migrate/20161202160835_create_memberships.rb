class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :volunteer_id
      t.integer :volunteers_group_id
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
