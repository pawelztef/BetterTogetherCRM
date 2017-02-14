class Visit < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :client
  has_one :event, as: :eventable
  has_many :notes, as: :notable
  accepts_nested_attributes_for :notes, reject_if: :all_blank, allow_destroy: true
end
