require 'rails_helper'

RSpec.describe VolunteersGroup, type: :model do
  describe 'column specyfication' do
    it { should have_db_column(:name).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:description).of_type(:text) }
  end
  describe 'validation' do
    it { should validate_presence_of(:name) }
    it 'validates uniqueness of :name' do
      FactoryGirl.create(:volunteers_group)
      should validate_uniqueness_of :name
    end
  end

  describe 'association' do 
    it { should have_many(:memberships) }
  end

end
