class DashboardController < ApplicationController
  def index
    @events = Event.all.order("id desc").limit(5)
    @data = Stat.data
    @liabilities = Stat.liabilities
    @donations = Donation.all.count
    @volunteers = Volunteer.includes(:volunteers_groups).where(volunteers_groups: {id: nil}).count
  end
end
