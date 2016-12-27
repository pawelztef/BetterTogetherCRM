class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @dog = Dog.new
    @client = Client.new
    @dog.client = @client
    @client.location = Location.new
  end

  def edit
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      gflash :success => 'Dog and his owner was succesfully created.'
      redirect_to dogs_url
    else
      gflash :now, :error =>'There was a problem while creating dog.'
      render :new
    end
  end

  def update
    if @dog.update dog_params
      gflash :success => 'Dog was succesfully updated.'
      redirect_to dogs_url 
    else
      gflash :now, :error =>'There was a problem while updating dog.'
      render :edit 
    end
  end

  def destroy
    @dog.destroy
    gflash :success => 'Dow was succesfully deleted.'
    redirect_to dogs_url 
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dog
    @dog = Dog.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dog_params
    params.require(:dog).permit(:id, :name, :chip_id, :age, :breed, :sex, :client_id)
  end

end
