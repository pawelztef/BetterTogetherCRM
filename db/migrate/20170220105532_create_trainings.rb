class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.boolean :dog_dog
      t.boolean :dog_human
      t.boolean :no_attachment
      t.boolean :ignore_calling
      t.boolean :no_heel
      t.boolean :toilet_home
      t.boolean :bite_furniture
      t.text :other
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
