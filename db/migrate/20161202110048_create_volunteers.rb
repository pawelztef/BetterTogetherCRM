class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone1,  null: false
      t.string :phone2, null: true

      t.timestamps null: false
    end
  end
end
