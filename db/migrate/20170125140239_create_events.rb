class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :start
      t.timestamp :end
      t.references :eventable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
