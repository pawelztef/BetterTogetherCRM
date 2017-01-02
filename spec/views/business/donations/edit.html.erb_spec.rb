require 'rails_helper'

RSpec.describe "business/donations/edit", type: :view do
  before(:each) do
    @business_donation = assign(:business_donation, Business::Donation.create!())
  end

  it "renders the edit business_donation form" do
    render

    assert_select "form[action=?][method=?]", business_donation_path(@business_donation), "post" do
    end
  end
end
