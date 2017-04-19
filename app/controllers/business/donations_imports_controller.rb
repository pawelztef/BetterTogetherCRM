class Business::DonationsImportsController < ApplicationController
  def new
    @donations_import = DonationsImport.new
  end
  def create
    @donations_import = DonationsImport.new(params[:donations_import])
    @donations_import.save
    render :new
  end
end
