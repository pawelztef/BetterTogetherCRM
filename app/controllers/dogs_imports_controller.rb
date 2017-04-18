class DogsImportsController < ApplicationController
  def new
    @dogs_import = DogsImport.new
  end
  def create
    @dogs_import = DogsImport.new(params[:dogs_import])
    @dogs_import.save
    render :new
  end
end
