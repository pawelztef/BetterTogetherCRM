class DonationsImport < ImportsExports::CsvImport

  def load_imported_objects
    sheet = open_spreadsheet
    donations = sheet.parse(id: 'id', transaction_id: 'transaction_id', amount: 'amount')
    donationHeader = donations.delete_at(0)
    donators = sheet.parse(first_name: 'first_name', last_name: 'last_name', email: 'email', phone1: 'phone1', phone2: 'phone2')
    donatorHeader = donators.delete_at(0)
    locations = sheet.parse(line1: 'line1', line2: 'line2', city: 'city', county: 'county', code: 'code')
    locationHeader = locations.delete_at(0)

    donations.map do |donation|
      index = donations.index(donation)
      if entry = Donation.find_by_id(donation[:id])
        @import_updates+=1
      else
        entry = Donation.new
        entry.donator = Donator.new
        entry.donator.location = Location.new
        @import_creates+=1
      end
      entry.attributes = donation
      entry.donator.attributes = donators[index]
      entry.donator.location.attributes = locations[index]
      entry
    end
  end

  def self.columns
    %w[id transaction_id amount first_name last_name email phone1 phone2
    line1 line2 city county code]
  end

end
