require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe 'association' do
    it{ should belong_to(:client) }
    it{ should belong_to(:volunteer) }
  end
end
