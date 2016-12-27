class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.includes(:dogs)
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @client = Client.new
    @client.location = Location.new
    @client.dogs.new
  end

  def edit
  end

  def create
    @client = Client.new client_params

    if @client.save 
      gflash :success => 'Client and his dog was succesfully created.'
      redirect_to clients_url
    else
      gflash :now, :error =>'There was a problem while creating client.'
      render :new
    end
  end

  def update
    if @client.update client_params 
      gflash :success => 'Client was succesfully updated.'
      redirect_to clients_url
    else
      gflash :now, :error =>'There was a problem while updating client.'
      render :edit 
    end
  end

  def destroy
    @client.destroy
    gflash :success => 'User was succesfully deleted.'
    redirect_to clients_url
  end

  private
  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:id, :first_name, :last_name, :email, :phone1, :phone2, :institution,
                                   location_attributes: [:id, :line1, :line2, :city, :county,
                                                         :code, :latitude, :longitude,
                                                         :localizable_id, :localizable_type])
  end

end
