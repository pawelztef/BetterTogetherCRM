require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'column specyfication' do
    it { should have_db_column(:first_name).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:last_name).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:email).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:password_digest).of_type(:string) }
    it { should have_db_column(:ownership).of_type(:boolean).with_options(presence: true) }
  end

  describe 'precence of attributes' do
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:email) }
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

  describe 'response to methods' do
    it 'respond to fulname method' 
    it 'repsond to owner? method' 
    it 'repsond to remove_withe_spaces? method' 
  end

end
