class Business::DonationsController < ApplicationController
  before_action :set_business_donation, only: [:show, :edit, :update, :destroy]

  def index
    @business_donations = Donation.all
  end

  def show

   @donator = @business_donation.donator 
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @business_donation = Donation.new
    @business_donation.donator = Donator.new
    @business_donation.donator.location = Location.new
  end

  def edit
  end

  def create
    @business_donation = Donation.new(business_donation_params)
    @business_donation.donator = Donator.initialize_or_update business_donation_params
    if @business_donation.save
      redirect_to business_donations_url
    else
      render :new
    end
  end

  def update
    @business_donation.assign_attributes business_donation_params
    @business_donation.donator = Donator.initialize_or_update business_donation_params
    
    if @business_donation.save
      redirect_to business_donations_url
    else
      render :edit
    end
  end

  def destroy
    @business_donation.destroy
    redirect_to business_donations_url
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
