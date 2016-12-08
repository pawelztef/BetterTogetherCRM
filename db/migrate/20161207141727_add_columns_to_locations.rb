class AddColumnsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :localizable_id, :integer
    add_column :locations, :localizable_type, :string
  end
end
