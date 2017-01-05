class Business::DonatorsController < ApplicationController
  def index
    @donators = Donator.all
  end

  def show
    @donator = Donator.find params[:id]
  end
end
