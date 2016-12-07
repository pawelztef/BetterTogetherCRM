class Location < ActiveRecord::Base
  validates :line1, :city, :county, presence: true

  def full_street_address 
    return "#{self.line1} #{self.line2} #{self.city} #{self.code}"
  end
end
