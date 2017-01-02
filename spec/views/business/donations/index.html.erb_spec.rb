require 'rails_helper'

RSpec.describe "business/donations/index", type: :view do
  before(:each) do
    assign(:business_donations, [
      Business::Donation.create!(),
      Business::Donation.create!()
    ])
  end

  it "renders a list of business/donations" do
    render
  end
end
