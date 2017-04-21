class DogsOwnersImportsController < ApplicationController
  before_action :set_owners_import
  
  def new
  end
  
  def create
    if params[:dogs_owners_import].blank?
      raise Exceptions::NoFileException
    else
      @owners_import = DogsOwnersImport.new(params[:dogs_owners_import])
      @owners_import.save
      render :new
    end
  end
  
  private
  
  def set_owners_import
    @owners_import = DogsOwnersImport.new
  end
end
