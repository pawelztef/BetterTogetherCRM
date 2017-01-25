class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :dogs, :custom_events do |t|
      t.index [:dog_id, :custom_event_id]
      t.index [:custom_event_id, :dog_id]
    end
  end
end
