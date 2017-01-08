require 'rails_helper'
require 'support/standard_details'
require 'support/initialize_or_update'

RSpec.describe Client, type: :model do

  let!(:client) { FactoryGirl.create(:client) }

  it_behaves_like 'have common user details'

  describe 'column specyfication' do
    it { should have_db_column(:phone1).of_type(:string).with_options(presence: true) } 
    it { should have_db_column(:phone2).of_type(:string) }
    it { should have_db_column(:institution).of_type(:boolean) }
  end

  describe 'presence of attributes' do
    it { should validate_presence_of(:phone1) }
  end

  describe 'uniqueness_of attributes' do
    it 'validates uniquness of last_name' do
      should validate_uniqueness_of(:last_name).scoped_to(:first_name) 
    end
    it 'validates uniquness of first_name' do
      should validate_uniqueness_of(:first_name).scoped_to(:last_name) 
    end
    it 'validates uniquness of email' do
      should validate_uniqueness_of(:email)
    end
  end

  describe 'nested attributes' do
    it{ should accept_nested_attributes_for(:dogs) }
    it{ should accept_nested_attributes_for(:location) }
  end

  describe 'association' do
    it { should have_many :dogs }
    it { should have_one :location }
  end

  context 'method responsivnes' do
    describe 'method #fullname' do
      it 'respond to #fullname' do  
        expect(client).to respond_to :fullname
      end
      it '#fullname return proper string' do
        expect(client.fullname).to match /^[A-Z]\w+\s[A-Z]\w+$/
      end
    end
    describe "megthod #remove_white_spaces" do
      it 'repsond to #remove_withe_spaces method' do
        expect(client).to respond_to :remove_white_spaces
      end
      it 'return corect string' do
        client.remove_white_spaces
        expect(client.first_name).not_to match /\s/
        expect(client.last_name).not_to match /\s/
        expect(client.email).not_to match /\s/
      end
    end
    describe 'method .initialize_or_update' do
      let(:klass) { class_double subject.class }
      it_behaves_like 'have initialize_or_update'
    end
  end

end
