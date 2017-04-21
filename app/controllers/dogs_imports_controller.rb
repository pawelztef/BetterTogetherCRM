class DogsImportsController < ApplicationController
  before_action :set_dogs_import

  def new
  end

  def create
    if params[:dogs_import].blank?
      raise Exceptions::NoFileException
    else
      @dogs_import = DogsImport.new(params[:dogs_import])
      @dogs_import.save
      render :new
    end
  end

  private

  def set_dogs_import
    @dogs_import = DogsImport.new
  end

end
