class CustomEvent < ActiveRecord::Base
  validates :title, :description, presence: true
  has_and_belongs_to_many :dogs
  has_many :events, as: :eventable
end
