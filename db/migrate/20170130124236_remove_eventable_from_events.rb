class RemoveEventableFromEvents < ActiveRecord::Migration
  def change
    remove_reference :events, :eventable, polymorphic: true
  end
end
