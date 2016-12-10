class AddIndexToLocations < ActiveRecord::Migration
  def change
    add_index :locations, [:localizable_id, :localizable_type]
  end
end
