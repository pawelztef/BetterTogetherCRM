class DogsOwnersImportsController < ApplicationController
  def new
    @owners_import = DogsOwnersImport.new
  end
  def create
    @owners_import = DogsOwnersImport.new(params[:dogs_owners_import])
    @owners_import.save
    render :new
  end
end
