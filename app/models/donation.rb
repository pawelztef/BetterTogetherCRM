class Donation < ActiveRecord::Base
  belongs_to :donator
  validates :amount, presence: true, numericality: true
  accepts_nested_attributes_for :donator

  def self.to_csv
    col_names = %w{id transaction_id amount donator created_at }
    CSV.generate(headers: true) do |csv|
      csv << col_names
      all.each do |donation|
          row = donation.attributes.values_at(*col_names)
          row[-2] = donation.donator.fullname
          csv << row
      end
    end
  end


end
