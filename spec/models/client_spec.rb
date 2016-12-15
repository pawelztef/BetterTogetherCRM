require 'rails_helper'

RSpec.describe Client, type: :model do

  describe 'column specyfication' do
    it { should have_db_column(:first_name).with_options(presence: true) } 
    it { should have_db_column(:last_name).with_options(presence: true) } 
    it { should have_db_column(:email).with_options(presence: true) } 
    it { should have_db_column(:phone1).with_options(presence: true) } 
    it { should have_db_column(:phone2) }
    it { should have_db_column(:institution) }
  end

  describe 'presence of attributes' do
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone1) }
  end

  describe 'uniqueness_of attributes' do
    it 'validates uniquness of last_name' do
      FactoryGirl.create(:client)
      should validate_uniqueness_of(:last_name).scoped_to(:first_name) 
    end
    it 'validates uniquness of first_name' do
      FactoryGirl.create(:client)
      should validate_uniqueness_of(:first_name).scoped_to(:last_name) 
    end
    it 'validates uniquness of email' do
      FactoryGirl.create(:client)
      should validate_uniqueness_of(:email)
    end
  end

  describe 'nested attributes' do
    it{ should accept_nested_attributes_for(:dogs) }
  end

  describe 'association' do
    it { should have_many :dogs }
  end

  describe 'method responsivnes' do
    it 'respond to #fullname' do  
      client = FactoryGirl.create(:client)
      expect(client).to respond_to :fullname
    end
  end



end
