require 'rails_helper'

RSpec.describe "business/donations/show", type: :view do
  before(:each) do
    @business_donation = assign(:business_donation, Business::Donation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
