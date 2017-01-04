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
    @donator = Donator.new
    @donator.location = Location.new
  end

  def edit
  end

  def create
    @business_donation = Donation.new(transaction_id: business_donation_params[:transaction_id],
                                      amount: business_donation_params[:amount], 
                                      donator: Donator.new(business_donation_params[:donator]))
    byebug
    # @business_donation.donator = Donator.new #business_donation_params[:donator]
    # @donator = Donator.create_or_update business_donation_params[:donator]
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
                                     donator: [:first_name, :last_name, :email, :phone1, :phone2, :institution,
                                     location_attributes: [:line1, :line2, :city, :county, :code]] )
  end
end
