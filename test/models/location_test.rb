require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  test "valid location" do
    # location = Location.new(line1: "Newhaven", line2: "Bay", 
    #                         city: "balbriggan", county: "dublin",
    #                         code: "333-333", latitude: 14.333,
    #                         longitude: 17.333)
   
    location = locations(:one)
    assert location.valid?
  end

  test "invalid wihout line1" do
    location = Location.new(line2: "Bay", 
                            city: "balbriggan", county: "dublin",
                            code: "333-333", latitude: 14.333,
                            longitude: 17.333)
    refute location.valid?
    assert_not_nil location.errors[:line1]

  end

  test "invalid witout city" do
    location = Location.new(line1: "newhaven", line2: "Bay", 
                            county: "dublin", code: "333-333",
                            latitude: 14.333, longitude: 17.333)
    refute location.valid?
    assert_not_nil location.errors[:city]
  end

  test "invalid witout county" do
    location = Location.new(line1: "Newhaven", line2: "Bay", 
                            city: "balbriggan", code: "333-333",
                            latitude: 14.333, longitude: 17.333)
    refute location.valid?
    assert_not_nil location.errors[:county]
  end

  test "should generate string" do
    location = locations(:one)
    str = "#{location.line1} #{location.line2} #{location.city} #{location.code}"
    assert_equal str, location.full_street_address
  end

  test "should generate coordinates" do
    location = Location.new(line1: "newhaven", line2: "Bay", city: "Balbriggan",
                            county: "dublin", code: "333-333")
    location.save
    assert location.latitude?
    assert location.longitude?
  end
end
