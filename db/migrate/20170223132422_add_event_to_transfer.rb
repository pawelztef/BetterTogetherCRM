class AddEventToTransfer < ActiveRecord::Migration
  def change
    add_reference :transfers, :event, index: true, foreign_key: true
  end
end
