class Event < ActiveRecord::Base
  validates_presence_of :start, :end, :title
  belongs_to :eventable, polymorphic: true
  
end
