class DashboardController < ApplicationController
  def index
    @events = Event.all.order("id desc").limit(5)
  end
end
