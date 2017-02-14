class CustomEvent < ActiveRecord::Base
  validates :description, presence: true
  has_and_belongs_to_many :dogs
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :volunteers
  has_one :event, as: :eventable
end
