require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'column specyfication' do
    it { should have_db_column(:start).of_type(:datetime).with_options(presence: true) }
    it { should have_db_column(:end).of_type(:datetime).with_options(presence: true) }
    it { should have_db_column(:eventable_id).of_type(:integer) }
    it { should have_db_column(:eventable_type).of_type(:string) }
  end
  describe 'validation' do
    describe 'precence of attributes' do
      it { should validate_presence_of(:start) }
      it { should validate_presence_of(:end) }
    end
  end
  describe 'association' do
    it{ should belong_to(:eventable) }
  end
end
