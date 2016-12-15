class AddClientToDogs < ActiveRecord::Migration
  def change
    add_reference :dogs, :client, index: true, foreign_key: true
  end
end
