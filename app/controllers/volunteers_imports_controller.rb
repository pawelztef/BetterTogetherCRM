class VolunteersImportsController < ApplicationController
  def new
    @volunteers_import = VolunteersImport.new
  end
  def create
    @volunteers_import = VolunteersImport.new(params[:volunteers_import])
    @volunteers_import.save
    render :new
  end
end
