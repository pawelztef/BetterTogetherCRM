class Stat < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  def self.data
    x = []
    Plutus::Asset.all.map do |n|
      if n.balance > 0
        x << [n.name, n.balance.truncate(2).to_s]
      end
    end
    x
  end

  def self.chart_data(data)
    x = []
    data.map do |n|
      if n.balance != 0
        x << [n.name, n.balance.truncate(2).to_s]
      end
    end
    x
  end

  #Liabilites
  
  def self.liabilities
    ['liabilities', number_format(Plutus::Liability.balance)]
  end

  #Assets
  
  def self.assets
    ['assets', number_format(Plutus::Asset.balance)]
  end

  #Equities
  
  def self.equities
    ['equities', number_format(Plutus::Equity.balance)]
  end
  
  #Revenues
  
  def self.revenues
    ['revenues', number_format(Plutus::Revenue.balance)]
  end

  #Expenses
  
  def self.expenses
    ['expenses', number_format(Plutus::Expanse.balance)]
  end

  private
  def self.number_format big_d
    big_d.truncate(2).to_s
  end

end
