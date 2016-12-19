class Donation < ActiveRecord::Base
  belongs_to :client
  validates :amount, presence: true, numericality: true
  
end
