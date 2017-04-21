class Business::DonationsImportsController < ApplicationController
  before_action :set_donations_import

  def new
  end

  def create
    if params[:donations_import].blank?
      raise Exceptions::NoFileException
    else
      @donations_import = DonationsImport.new(params[:donations_import])
      @donations_import.save
      render :new
    end
  end

  private

  def set_donations_import
    @donations_import = DonationsImport.new
  end
end
