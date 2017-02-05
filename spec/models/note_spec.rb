require 'rails_helper'

RSpec.describe Note, type: :model do

  describe 'column specyfication' do
    it { should have_db_column(:content).of_type(:text) } 
    it { should have_db_column(:notable_id).of_type(:integer) }
    it { should have_db_column(:notable_type).of_type(:string) }
  end
  describe 'association' do
    it { should belong_to :notable }
  end
end

