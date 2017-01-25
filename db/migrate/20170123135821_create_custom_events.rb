class CreateCustomEvents < ActiveRecord::Migration
  def change
    create_table :custom_events do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
