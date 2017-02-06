class Visit < ActiveRecord::Base
  has_and_belongs_to_many :events
  belongs_to :volunteer
  belongs_to :client
  has_many :notes, as: :notable
  accepts_nested_attributes_for :notes, reject_if: :all_blank, allow_destroy: true
end
