require 'rails_helper'

RSpec.describe "business/donations/new", type: :view do
  before(:each) do
    assign(:business_donation, Business::Donation.new())
  end

  it "renders new business_donation form" do
    render

    assert_select "form[action=?][method=?]", business_donations_path, "post" do
    end
  end
end
