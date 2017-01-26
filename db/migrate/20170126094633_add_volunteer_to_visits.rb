class AddVolunteerToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :volunteer, index: true, foreign_key: true
  end
end
