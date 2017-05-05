class Business::EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Plutus::Entry.page(params[:page]).per(5).includes([credit_amounts: :account, debit_amounts: :account])
    @entries = PaginatingDecorator.decorate(@entries)
  end

  def show
  end

  def new
    @entry = Plutus::Entry.new
    @entry.debit_amounts.build
    @entry.credit_amounts.build
  end

  def edit
  end

  def create
    @entry = Plutus::Entry.new(entry_params)

    if @entry.save
      redirect_to business_entry_url @entry
      gflash notice: 'Entry was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to business_entry_url @entry
      gflash notice: 'Entry was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_url, notice: 'Entry was successfully destroyed.'
    head :no_content 
  end

  private
  def set_entry
    @entry = Plutus::Entry.find(params[:id])
  end

  def entry_params
    params[:entry].permit(:created_at, :description,
                          credit_amounts_attributes: [:account_id, :amount],
                          debit_amounts_attributes: [:account_id, :amount])
  end
end
