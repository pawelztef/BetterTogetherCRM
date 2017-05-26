class AddMenuBtnsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :task, :string
    add_column :settings, :message, :string
    add_column :settings, :dashboard, :string
    add_column :settings, :volunteer, :string
    add_column :settings, :dog, :string
    add_column :settings, :business, :string
    add_column :settings, :account, :string
    add_column :settings, :statistic, :string
    add_column :settings, :event, :string
    add_column :settings, :setting, :string
  end
end
