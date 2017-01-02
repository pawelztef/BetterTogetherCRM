require 'rails_helper'

RSpec.describe "Business::Donations", type: :request do
  describe "GET /business_donations" do
    it "works! (now write some real specs)" do
      get business_donations_path
      expect(response).to have_http_status(200)
    end
  end
end
