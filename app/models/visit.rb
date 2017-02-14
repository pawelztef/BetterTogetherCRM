class Visit < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :client
  has_one :event, as: :eventable
end
