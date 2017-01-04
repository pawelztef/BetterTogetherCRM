class Business::DonationsController < ApplicationController
  before_action :set_business_donation, only: [:show, :edit, :update, :destroy]

  def index
    @business_donations = Donation.all
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @business_donation = Donation.new
    @business_donation.donator = Donator.new
    @business_donation.donator.location = Location.new
    # @donator = Donator.new
    # @donator.location = Location.new
  end

  def edit
  end

  def create
    @business_donation = Donation.new(business_donation_params)
    @donator = Donator.where(first_name: business_donation_params[:donator_attributes][:first_name],
                                               last_name: business_donation_params[:donator_attributes][:last_name])
                      .first_or_initialize
                      
    @donator.assign_attributes({ email: business_donation_params[:donator_attributes][:email],
                                         phone1: business_donation_params[:donator_attributes][:phone1],
                                         phone2: business_donation_params[:donator_attributes][:phone2],
                                         institution: business_donation_params[:donator_attributes][:institution],
                                         location: Location.new(business_donation_params[:donator_attributes][:location_attributes])})
    @business_donation.donator = @donator
    # @business_donation.donator.location = Location.new business_donation_params[:donator_attributes][:location]
    byebug
    if @business_donation.save
      redirect_to business_donations_url
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @business_donation.update(business_donation_params)
        format.html { redirect_to @business_donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_donation }
      else
        format.html { render :edit }
        format.json { render json: @business_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business_donation.destroy
    respond_to do |format|
      format.html { redirect_to business_donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_business_donation
    @business_donation = Donation.find(params[:id])
  end

  def business_donation_params
    params.require(:donation).permit(:amount, :transaction_id, 
                                     donator_attributes: [:first_name, :last_name, :email, :phone1, :phone2, :institution,
                                     location_attributes: [:line1, :line2, :city, :county, :code]] )
  end
end
