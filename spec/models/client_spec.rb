require 'rails_helper'

RSpec.describe Client, type: :model do

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

  describe 'association' do
    pending("waiting for implementation")
  end

  describe 'method responsivnes'


end
