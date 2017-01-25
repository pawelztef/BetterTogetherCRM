require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe 'column specyfication' do
    it { should have_db_column(:name).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:chip_id).of_type(:string) }
    it { should have_db_column(:age).of_type(:string).with_options(presen: true) }
    it { should have_db_column(:sex).of_type(:string) }
    it { should have_db_column(:breed).of_type(:string).with_options(presen: true) }
    it { should have_db_column(:client_id).of_type(:integer) }
  end

  describe 'validation' do
    describe 'precence of attributes' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:breed) }
      it { should validate_presence_of(:sex) }
      it { should validate_length_of(:sex).is_equal_to(1) }
      it { should validate_presence_of(:age) }
    end
  end

  describe 'association' do
    it { should belong_to(:client) }
    it { should have_and_belong_to_many(:custom_events) }
    # it 'proper test for association' do
    #   dog = FactoryGirl.create(:dog)
    #   cli = FactoryGirl.create(:client)
    #   dog.client = cli
    #   expect(dog.client).not_to be_nil
    # end
  end

end
