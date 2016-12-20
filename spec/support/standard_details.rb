shared_examples_for('have common user details') do
  describe 'column specyfication' do
    it { should have_db_column(:first_name).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:last_name).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:email).of_type(:string).with_options(presence: true) }
  end
  describe 'presence of attributes' do
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:email) }
  end
end
