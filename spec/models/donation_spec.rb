require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe 'column specyfication' do
    it { should have_db_column(:transaction_id).of_type(:string) }
    it { should have_db_column(:amount).of_type(:float).with_options(presence: true) }
  end
  describe 'validation' do
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount) }
    it { pending 'should validate uniqueness of transaction_id' }
  end
  describe 'associations' do
    it {should belong_to(:donator) }
  end
  describe 'nested attributes' do
    it{ should accept_nested_attributes_for(:donator) }
  end
  

end
