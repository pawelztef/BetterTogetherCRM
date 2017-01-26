class AddClientToVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :client, index: true, foreign_key: true
  end
end
