require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  describe 'column specyfication' do
    it { should have_db_column(:first_name).with_options(presence: true) } 
    it { should have_db_column(:last_name).with_options(presence: true) } 
    it { should have_db_column(:email).with_options(presence: true) } 
    it { should have_db_column(:phone1).with_options(presence: true) } 
    it { should have_db_column(:phone2) }
  end
  
  describe 'validation' do
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone1) }
  end

  describe 'association' do
    it { should have_many :memberships}
    it { should have_many :volunteers_groups}
    it { should have_one :location}
    
    it 'have memberships association' do
      volunteer = FactoryGirl.create(:volunteer)
      volunteerGrp = FactoryGirl.create(:volunteers_group)
      volunteer.volunteers_groups << volunteerGrp
      volg = volunteer.memberships.where("volunteers_group_id = ? ", volunteerGrp.id)
      expect(volg).not_to be_nil 
    end
  end

  context 'respnding to methods' do
    it 'respond to #fullname' do  
      volunteer = FactoryGirl.create(:volunteer)
      expect(volunteer).to respond_to :fullname
    end
    it '#fullname return proper string' do
      volunteer = FactoryGirl.create(:volunteer)
      expect(volunteer.fullname).to match /^[A-Z]\w+\s[A-Z]\w+$/
    end
    it 'repsond to remove_withe_spaces method' do
      volunteer = FactoryGirl.create(:volunteer)
      expect(volunteer).to respond_to :remove_white_spaces
      volunteer.remove_white_spaces
      expect(volunteer.first_name).not_to match /\s/
      expect(volunteer.last_name).not_to match /\s/
      expect(volunteer.email).not_to match /\s/
    end
  end
end
