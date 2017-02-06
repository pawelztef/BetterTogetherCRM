class CustomEvent < ActiveRecord::Base
  validates :description, presence: true
  has_and_belongs_to_many :dogs
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :volunteers
  has_and_belongs_to_many :events
  has_many :notes, as: :notable
  accepts_nested_attributes_for :notes#, reject_if: :all_blank, allow_destroy: true
end
