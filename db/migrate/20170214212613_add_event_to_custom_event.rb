class AddEventToCustomEvent < ActiveRecord::Migration
  def change
    add_reference :custom_events, :event, index: true, foreign_key: true
  end
end
