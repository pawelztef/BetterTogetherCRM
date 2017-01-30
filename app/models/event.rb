class Event < ActiveRecord::Base
  has_and_belongs_to_many :custom_events
  has_and_belongs_to_many :visits
  validates_presence_of :start, :end, :title
  
  accepts_nested_attributes_for :custom_events, allow_destroy: true
  accepts_nested_attributes_for :visits, allow_destroy: true
end
