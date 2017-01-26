class CreateJoinTableVol < ActiveRecord::Migration
  def change
    create_join_table :volunteers, :custom_events do |t|
      t.index [:volunteer_id, :custom_event_id], name: 'index_custom_events_on_cust_eve_id'
      t.index [:custom_event_id, :volunteer_id], name: 'index_custom_events_on_vol_id'
    end
  end
end
