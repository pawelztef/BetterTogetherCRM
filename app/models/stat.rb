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
  def self.liabilities
    ['liabilities', number_format(Plutus::Liability.balance)]
  end
  private
  def self.number_format big_d
    big_d.truncate(2).to_s
  end
end
