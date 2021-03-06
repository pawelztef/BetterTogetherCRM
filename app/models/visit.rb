class Visit < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :client
  belongs_to :event
  has_one :note, as: :notable
  accepts_nested_attributes_for :note, allow_destroy: true
end
