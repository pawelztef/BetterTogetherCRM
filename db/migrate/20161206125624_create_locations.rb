class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :line1, null: false
      t.string :line2
      t.string :city, null: false
      t.string :county, null: false
      t.string :code
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
