class Donation < ActiveRecord::Base
  belongs_to :donator
  validates :amount, presence: true, numericality: true
  accepts_nested_attributes_for :donator
  
end
