class Transfer < ActiveRecord::Base
  belongs_to :dog
  belongs_to :sender, class_name: 'Client'
  belongs_to :recipient, class_name: 'Client'
  belongs_to :volunteer
end
