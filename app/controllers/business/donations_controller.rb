class Business::DonationsController < ApplicationController
  before_action :set_business_donation, only: [:show, :edit, :update, :destroy]

  # GET /business/donations
  # GET /business/donations.json
  def index
    @business_donations = Donation.all
  end

  # GET /business/donations/1
  # GET /business/donations/1.json
  def show
  end

  # GET /business/donations/new
  def new
    @business_donation = Business::Donation.new
  end

  # GET /business/donations/1/edit
  def edit
  end

  # POST /business/donations
  # POST /business/donations.json
  def create
    @business_donation = Business::Donation.new(business_donation_params)

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

  # PATCH/PUT /business/donations/1
  # PATCH/PUT /business/donations/1.json
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

  # DELETE /business/donations/1
  # DELETE /business/donations/1.json
  def destroy
    @business_donation.destroy
    respond_to do |format|
      format.html { redirect_to business_donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_donation
      @business_donation = Business::Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_donation_params
      params.fetch(:business_donation, {})
    end
end
