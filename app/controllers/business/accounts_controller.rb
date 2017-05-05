class Business::AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Plutus::Account.all.includes([:credit_amounts, :debit_amounts]).decorate
  end

  %w(asset liability expense revenue equity).each do |account_type|
    method_name = account_type.pluralize

    define_method method_name do
      @accounts = Plutus.const_get(account_type.capitalize).all
      .includes([:credit_amounts, :debit_amounts])
      .decorate

      render :index
    end
  end

  def show
  end

  def new
    @account = Plutus::Account.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @account = Plutus::Account.new(account_params)
      if @account.save
         redirect_to business_account_path(@account) 
         gflash notice: 'Account was successfully created.'
      else
         render action: 'new' 
      end
  end

  def update
    if @account.update(account_params)
      redirect_to business_account_path(@account)
      gflash notice: 'Account was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @account.destroy
    redirect_to business_accounts_url
    gflash notice: 'Account was successfully destroyed.' 
  end

  private

  def set_account
    @account = Plutus::Account.includes([credit_amounts: :entry, debit_amounts: :entry])
    .find(params[:id]).decorate
  end

  def account_params
    params.require(:account).permit(:name, :code, :type)
  end
end
