require 'test_helper'

class VolunteerTest < ActiveSupport::TestCase

  def setup
    @volunteer = Volunteer.new( first_name: 'Jon',
                               last_name: 'Johnson',
                               email: 'jon@jon.com',
                               phone1: '3333',
                               phone2: '4444',)

    @location = Location.new(line1: '127 Newhaven',
                             city: 'Balbriggan',
                             county: 'Dublin')
    @location2 = Location.new(line1: '129 Newhaven',
                             city: 'Tyrrlestown',
                             county: 'Dublin')
  end

  test 'valid volunteer' do
    assert @volunteer.valid?
  end

  test 'invalid whitout first_name' do
    @volunteer.first_name = nil
    refute @volunteer.valid?
  end
  
  test 'invalid whitout last_name' do
    @volunteer.last_name = nil
    refute @volunteer.valid?
  end

  test 'invalid whitout email' do
    @volunteer.email = nil
    refute @volunteer.valid?
  end

  test 'invalid whitout phone1' do
    @volunteer.phone1 = nil
    refute @volunteer.valid?
  end

  test 'should generate string' do
    assert_not_nil @volunteer.fullname
  end

  test 'should have only one location' do
    @volunteer.save
    @volunteer.location = @location
    @volunteer.location = @location2
    size = Array.new
    size << Location.find_by_localizable_id(@volunteer)
    assert_equal size.size, 1
  end




end
