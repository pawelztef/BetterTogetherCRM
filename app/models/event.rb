class Event < ActiveRecord::Base
  belongs_to :eventable, polymorphic: true
  has_one :note, as: :notable
  
  validates_presence_of :start, :end, :title

  accepts_nested_attributes_for :note, 
    reject_if: :all_blank, allow_destroy: true
  
end
