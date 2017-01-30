class RemoveTitleFromCustomEvents < ActiveRecord::Migration
  def change
    remove_column :custom_events, :title, :string
  end
end
