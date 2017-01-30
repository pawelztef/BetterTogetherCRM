class CreateJoinTableEventVisits < ActiveRecord::Migration
  def change
    create_join_table :events, :visits do |t|
      t.index [:event_id, :visit_id]
      t.index [:visit_id, :event_id]
    end
  end
end
