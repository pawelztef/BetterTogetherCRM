class CustomEvent < ActiveRecord::Base
  validates :title, :description, presence: true
  has_and_belongs_to_many :dogs
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :volunteers
  has_many :events, as: :eventable
end
