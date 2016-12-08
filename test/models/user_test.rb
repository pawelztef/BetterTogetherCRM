require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(id: 1,
                     first_name: 'Jon',
                     last_name: 'Johnson',
                     email: 'jon@jon.com',
                     password_digest: '3333',
                     ownership: 0) 

    @location = Location.new(line1: '127 Newhaven',
                             city: 'Balbriggan',
                             county: 'Dublin',
                             localizable_id: 1,
                             localizable_type: 'User')
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

  # test 'invalid whitout ownership' do
  #   owner = users(:owner)
  #   owner.ownership = nil
  #   refute owner.valid?
  # end


  test 'should have location' do
    assert_not_nil @user.locations
  end



end
