class DogImportsController < ApplicationController
  def new
    @dog_import = DogImport.new
  end
  def create
    @dog_import = DogImport.new(params[:dog_import])
    @dog_import.save
    render :new
  end
end
