class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true
  validates_presence_of :start, :end
end
