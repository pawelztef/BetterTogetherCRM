class Business::GeneralLedgerController < ApplicationController
  def index
    @accounts = Plutus::Account.all
  end
end
