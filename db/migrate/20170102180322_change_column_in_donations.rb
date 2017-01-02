class ChangeColumnInDonations < ActiveRecord::Migration
  def change
    rename_column :donations, :client_id, :donator_id
  end
end
