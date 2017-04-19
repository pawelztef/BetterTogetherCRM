class DogsOwnersImport < ImportsExports::CsvImport

  def load_imported_objects
    sheet = open_spreadsheet
    owners = sheet.parse(id: 'id', first_name: 'first_name', last_name: 'last_name', email: 'email', phone1: 'phone1', phone2: 'phone2')
    ownerHeader = owners.delete_at(0)
    locations = sheet.parse(line1: 'line1', line2: 'line2', city: 'city', county: 'county', code: 'code')
    locationHeader = locations.delete_at(0)

    owners.map do |owner|
      index = owners.index(owner)
      # binding.pry
      if entry = Client.find_by_id(owner[:id])
        @import_updates+=1  
      else
        @import_updates+=1  
      end
      entry.attributes = owner
      entry.location.attributes = locations[index]
      entry
    end
  end

  def columns
    ['id', 'first_name', 'last_name', 'email', 'phone1', 'phone2',
     'line1', 'line2', 'city', 'county', 'code']
  end

end
