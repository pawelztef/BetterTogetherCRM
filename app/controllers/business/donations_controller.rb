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
  end

  def edit
  end

  def create
    @business_donation = Donation.new(business_donation_params)

    respond_to do |format|
      if @business_donation.save
        format.html { redirect_to @business_donation, notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: @business_donation }
      else
        format.html { render :new }
        format.json { render json: @business_donation.errors, status: :unprocessable_entity }
      end
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
      params.fetch(:business_donation, {})
    end
end
