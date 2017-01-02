class Donation < ActiveRecord::Base
  belongs_to :donator
  validates :amount, presence: true, numericality: true
  
end
