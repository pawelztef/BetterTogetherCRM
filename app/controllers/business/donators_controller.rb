class Business::DonatorsController < ApplicationController
  def index
    @donators = Donator.all
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
