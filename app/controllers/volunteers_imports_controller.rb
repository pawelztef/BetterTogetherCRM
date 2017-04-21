class VolunteersImportsController < ApplicationController
  before_action :set_volunteers_imports
  
  def new
  end

  def create
    if params[:volunteers_import].blank?
      raise Exceptions::NoFileException
    else
      @volunteers_import = VolunteersImport.new(params[:volunteers_import])
      @volunteers_import.save
      render :new
    end
  end

private
  def set_volunteers_imports
    @volunteers_import = VolunteersImport.new
  end
  
end
