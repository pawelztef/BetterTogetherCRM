class Training < ActiveRecord::Base
  belongs_to :event
  has_one :note, as: :notable
  accepts_nested_attributes_for :note, allow_destroy: true
end
