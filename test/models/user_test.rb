require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: 'Jon',
                     last_name: 'Johnson',
                     email: 'jon@jon.com',
                     password_digest: '3333',
                     ownership: 1) 

    @location = Location.new(line1: '127 Newhaven',
                             city: 'Balbriggan',
                             county: 'Dublin')
    @location2 = Location.new(line1: '129 Newhaven',
                             city: 'Tyrrlestown',
                             county: 'Dublin')
  end

  test 'valid user' do
    assert users(:owner).valid?
  end

  test 'invalid whitout first_name' do
    owner = users(:owner)
    owner.first_name = nil
    refute owner.valid?
  end

  test 'invalid whitout last_name' do
    owner = users(:owner)
    owner.last_name = nil
    refute owner.valid?
  end

  test 'invalid whitout email' do
    owner = users(:owner)
    owner.email = nil
    refute owner.valid?
  end

  test 'should have only one location' do
    @user.id = 3
    @user.save
    @user.location = @location
    @user.location = @location2
    locArray = Array.new
    locArray << Location.find_by_localizable_id(@user)
    assert_equal locArray.size, 1
  end



end
