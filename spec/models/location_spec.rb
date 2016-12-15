require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'presence of attributes' do
    it { should validate_presence_of(:line1) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:county) }
  end


  describe 'association' do
    it { should belong_to(:localizable) }
  end

  describe 'column_specification' do
    it { should have_db_column(:line1).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:line2 ).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:city).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:code).of_type(:string) }
    it { should have_db_column(:county).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:latitude).of_type(:float).with_options(presence: true) }
    it { should have_db_column(:longitude).of_type(:float).with_options(presence: true) }
    it { should have_db_column(:localizable_id).of_type(:integer) }
    it { should have_db_column(:localizable_type).of_type(:string) }
    it { should have_db_index([:localizable_id, :localizable_type]) }
  end

  describe 'method responsivnes' do
    context 'method full_street_address' do
      it 'respond to #fullname' do  
        location = FactoryGirl.create(:location)
        expect(location).to respond_to :full_street_address
      end
      it 'return proper string' do
        location = FactoryGirl.create(:location)
        expect(location.full_street_address).to match /\w+\s\w+\s\w+\s(\w+)?/
      end
    end

    it 'should run #geocode method after_validation'
    it 'should run #geocode method before_update'

  end

end
