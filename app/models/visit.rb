class Visit < ActiveRecord::Base
  has_and_belongs_to_many :events
  belongs_to :volunteer
  belongs_to :client
  has_many :notes, as: :notable
end
