class VolunteerImportsController < ApplicationController
  def new
    @volunteer_import = VolunteerImport.new
  end
  def create
    @volunteer_import = VolunteerImport.new(params[:volunteer_import])
    @volunteer_import.save
    render :new
  end
end
