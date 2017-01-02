require "rails_helper"

RSpec.describe Business::DonationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/business/donations").to route_to("business/donations#index")
    end

    it "routes to #new" do
      expect(:get => "/business/donations/new").to route_to("business/donations#new")
    end

    it "routes to #show" do
      expect(:get => "/business/donations/1").to route_to("business/donations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/business/donations/1/edit").to route_to("business/donations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/business/donations").to route_to("business/donations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/business/donations/1").to route_to("business/donations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/business/donations/1").to route_to("business/donations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/business/donations/1").to route_to("business/donations#destroy", :id => "1")
    end

  end
end
