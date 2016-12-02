class Membership < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :volunteers_group
end
