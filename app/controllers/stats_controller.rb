class StatsController < ApplicationController
  def index
    @events = Event.all.order("id desc").limit(5)
    @data = Stat.data
    @liabilities = Stat.liabilities
  end
end
