class CreateJoinTableEventCustomEvent < ActiveRecord::Migration
  def change
    create_join_table :events, :custom_events do |t|
      t.index [:event_id, :custom_event_id]
      t.index [:custom_event_id, :event_id]
    end
  end
end
