class Business::DonatorsController < ApplicationController
  def index
    @donators = Donator.all
    respond_to do |format|
      format.html
      format.csv { send_data @donators.to_csv, filename: "donators-#{Date.today}.csv" }
    end
  end

  def show
    @donator = Donator.find params[:id]
    @donations = @donator.donations.all
    respond_to do |format|
      format.html
      format.js
    end
  end
end
