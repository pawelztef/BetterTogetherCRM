class Business::DonatorsImportsController < ApplicationController

  before_action :set_donators_import

  def new
  end

  def create
    if params[:donators_import].blank?
      raise Exceptions::NoFileException
    else
      @donators_import = DonatorsImport.new(params[:donators_import])
      @donators_import.save
      render :new
    end
  end

  private
  
  def set_donators_import
    @donators_import = DonatorsImport.new
  end

end

