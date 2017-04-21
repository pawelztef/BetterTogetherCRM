class VolunteersImport < ImportsExports::CsvImport

  def load_imported_objects
    sheet = open_spreadsheet

    volunteers = sheet.parse(id: 'id', first_name: 'first_name', last_name: 'last_name', email: 'email', phone1: 'phone1', phone2: 'phone2')
    volunteerHeader = volunteers.delete_at(0)


    locations = sheet.parse(line1: 'line1', line2: 'line2', city: 'city', county: 'county', code: 'code')
    locationHeader = locations.delete_at(0)

    volunteers.map do |volunteer|
      index = volunteers.index(volunteer)

      if entry = Volunteer.find_by_id(volunteer[:id])
        @import_updates+=1
      else
        entry = Volunteer.new
        entry.location = Location.new
        @import_creates+=1
      end
      entry.attributes = volunteer
      entry.location.attributes =  locations[index]
      entry
    end
  end

  def self.columns
    %w[id first_name last_name email phone1 phone2 line1 line2 city county code]
  end

end
