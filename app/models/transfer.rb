class Transfer < ActiveRecord::Base
  belongs_to :dog
  belongs_to :sender, class_name: 'Client'
  belongs_to :recipient, class_name: 'Client'
  has_one :note, as: :notable
  accepts_nested_attributes_for :note, allow_destroy: true
  belongs_to :volunteer
end
