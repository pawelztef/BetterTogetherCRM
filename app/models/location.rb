class Location < ActiveRecord::Base
  validates :line1, :city, :county, presence: true

  belongs_to :localizable, polymorphic: true

  geocoded_by :full_street_address
  after_validation :geocode
  before_update :geocode
  def full_street_address 
    return "#{self.line1} #{self.line2} #{self.city} #{self.code}"
  end
end
