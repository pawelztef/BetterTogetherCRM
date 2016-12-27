require 'rails_helper'
require 'support/standard_details'

RSpec.describe User, type: :model do
  
  it_behaves_like 'have common user details'

  describe 'column specyfication' do
    it { should have_db_column(:password_digest).of_type(:string) }
    it { should have_db_column(:ownership).of_type(:boolean).with_options(presence: true) }
  end

  describe 'precence of attributes' do
    it { should have_secure_password }
  end

  describe 'uniqueness of attributes' do
    it 'validates uniquness of last_name' do
      FactoryGirl.create(:user)
      should validate_uniqueness_of(:last_name).scoped_to(:first_name) 
    end
    it 'validates uniquness of first_name' do
      FactoryGirl.create(:user)
      should validate_uniqueness_of(:first_name).scoped_to(:last_name) 
    end
    it 'validates uniquness of email' do
      FactoryGirl.create(:user)
      should validate_uniqueness_of(:email)
    end
  end

  describe 'association' do
    it { should have_one(:location) }
  end

  describe 'acceptance of nested attributes' do
    it { should accept_nested_attributes_for(:location) }
  end

  context 'response to methods' do

    it 'respond to #fullname' do  
      user = FactoryGirl.create(:user)
      expect(user).to respond_to :fullname
    end

    it '#fullname return proper string' do
      user = FactoryGirl.create(:user)
      expect(user.fullname).to match /^[A-Z]\w+\s[A-Z]\w+$/
    end

    it 'repsond to owner? method' do
      user = FactoryGirl.create(:user)
      expect(user).not_to be_owner 
    end

    it 'repsond to remove_withe_spaces method' do
      user = FactoryGirl.create(:user)
      expect(user).to respond_to :remove_white_spaces
      user.remove_white_spaces
      expect(user.first_name).not_to match /\s/
      expect(user.last_name).not_to match /\s/
      expect(user.email).not_to match /\s/
    end

  end

end
