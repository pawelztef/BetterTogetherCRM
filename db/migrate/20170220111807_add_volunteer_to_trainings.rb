class AddVolunteerToTrainings < ActiveRecord::Migration
  def change
    add_reference :trainings, :volunteer, index: true, foreign_key: true
  end
end
