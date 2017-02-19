class CustomEvent < ActiveRecord::Base
  validates :description, presence: true
  has_and_belongs_to_many :dogs
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :volunteers
  has_one :note, as: :notable
  accepts_nested_attributes_for :note, allow_destroy: true
  belongs_to :event
end
