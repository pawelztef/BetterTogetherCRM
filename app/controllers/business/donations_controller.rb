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
    @business_donation.donator = Donator.initialize_or_update business_donation_params[:donator_attributes]
    if @business_donation.save
      gflash :success => 'Donation was succesfully stored.'
      redirect_to business_donations_url
    else
      gflash :now, :error =>'There was a problem while saving donation.'
      render :new
    end
  end

  def update
    @business_donation.assign_attributes business_donation_params
    @business_donation.donator = Donator.initialize_or_update business_donation_params[:donator_attributes]

    if @business_donation.save
      gflash :success => 'Donation was succesfully updated.'
      redirect_to business_donations_url
    else
      gflash :now, :error =>'There was a problem while updating donation.'
      render :edit
    end
  end

  def destroy
    @business_donation.destroy
    @tracelog = Tracelog.new trace_id: @business_donation.transaction_id, user_name: current_moderator.fullname , trace_type: 'donation'
    if @tracelog.save
      gflash :success => 'Donation was succesfully deleted.'
    else
      gflash :now, :warning =>'Donation was succesfully deleted, however there was a problem to store this action in log.' 
    end
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
