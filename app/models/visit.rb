class Visit < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :client
end
