class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.references :dog, index: true, foreign_key: true
      t.references :sender, index: true
      t.references :recipient, index: true
      t.references :volunteer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
