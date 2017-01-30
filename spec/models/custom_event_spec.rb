require 'rails_helper'

RSpec.describe CustomEvent, type: :model do

  describe 'column specyfication' do
    it { should have_db_column(:description).of_type(:text).with_options(presence: true) }
  end

  describe 'validation' do
    describe 'precence of attributes' do
      it { should validate_presence_of(:description) }
    end
  end
  
  describe 'association' do
    it{ should have_and_belong_to_many(:dogs) }
    it{ should have_and_belong_to_many(:clients) }
    it{ should have_and_belong_to_many(:volunteers) }
    it{ should have_and_belong_to_many(:events) }
  end

end
