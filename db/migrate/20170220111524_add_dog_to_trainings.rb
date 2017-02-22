class AddDogToTrainings < ActiveRecord::Migration
  def change
    add_reference :trainings, :dog, index: true, foreign_key: true
  end
end
