class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.string :chip_id
      t.string :age, null: false
      t.string :breed, null: false
      t.boolean :sex, null: false

      t.timestamps null: false
    end
  end
end
