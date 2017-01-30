require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'column specyfication' do
    it { should have_db_column(:title).of_type(:string)}
    it { should have_db_column(:start).of_type(:datetime).with_options(presence: true) }
    it { should have_db_column(:end).of_type(:datetime).with_options(presence: true) }
  end
  describe 'validation' do
    describe 'precence of attributes' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:start) }
      it { should validate_presence_of(:end) }
    end
  end
  describe 'association' do
    it{ should have_and_belong_to_many(:visits) }
    it{ should have_and_belong_to_many(:custom_events) }
    it{ should accept_nested_attributes_for(:visits).allow_destroy(true) }
    it{ should accept_nested_attributes_for(:custom_events).allow_destroy(true) }
  end
end
