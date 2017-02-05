require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe 'association' do
    it{ should belong_to(:client) }
    it{ should belong_to(:volunteer) }
    it{ should have_and_belong_to_many(:events) }
    it{ should have_many(:notes) }
  end
end
