class StatsController < ApplicationController
  layout "stats_layout"
  before_action :set_params
  def index
    @events = Event.all.order("id desc").limit(5)
    @data = Stat.data
    @liabilities = Stat.liabilities
  end

  def volunteers
  end

  def accounts
    case params[:accounts_group]
    when "Assets"
      @data = Plutus::Asset.all
    when "Liabilities"
      @data = Plutus::Liability.all
    when "Equities"
      @data = Plutus::Equity.all
    when "Revenues"
      @data = Plutus::Revenue.all
    when "Expenses"
      @data = Plutus::Expense.all
    else
      @data = Plutus::Revenue.all
    end
  end

  def donations
    @highest_donations = Donation.all.order('amount DESC').limit(5)
  end

  def clinets
  end

  private
  def set_params
    params[:period] ||= 'quarter'
    params[:last] ||= '6'
    params[:accounts_group] ||= 'Revenues'
  end

end
