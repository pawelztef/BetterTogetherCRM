class Donation < ActiveRecord::Base
  belongs_to :donator
  validates :amount, presence: true, numericality: true
  accepts_nested_attributes_for :donator

  def self.to_csv
    col_names = %w[id transaction_id amount first_name last_name email phone1 phone2
                line1 line2 city county code]
    donation_col = col_names[0, 3]
    donator_col = col_names[3, 5]
    location_col = col_names[8, 5]
    CSV.generate() do |csv|
      csv << col_names
      all.each do |donation|
        if donation.donator.present?
          row = donation.attributes.values_at(*donation_col) + donation.donator.attributes.values_at(*donator_col)
          row += donation.donator.location.attributes.values_at(*location_col) if donation.donator.location.present?
          csv << row
        else
          csv << donation.attributes.values_at(*donation_col)
        end
      end
    end
  end
end
