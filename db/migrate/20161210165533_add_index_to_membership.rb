class AddIndexToMembership < ActiveRecord::Migration
  def change
    add_index :memberships, [:volunteer_id, :volunteers_group_id]
  end
end
