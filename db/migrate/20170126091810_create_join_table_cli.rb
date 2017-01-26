class CreateJoinTableCli < ActiveRecord::Migration
  def change
    create_join_table :clients, :custom_events do |t|
      t.index [:client_id, :custom_event_id]
      t.index [:custom_event_id, :client_id]
    end
  end
end
