class CreateTracelogsTable < ActiveRecord::Migration
  def change
    create_table :tracelogs do |t| 
      t.string :trace_id, null: false
      t.string :user_name, null: false
      t.string :trace_type, null: false
    end
  end
end
