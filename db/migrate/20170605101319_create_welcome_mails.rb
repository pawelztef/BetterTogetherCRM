class CreateWelcomeMails < ActiveRecord::Migration
  def change
    create_table :welcome_mails do |t|
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
