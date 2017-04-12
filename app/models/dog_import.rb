class DogImport < ImportsExports::CsvImport


  # def load_imported_objects
  #   spreadsheet = open_spreadsheet
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).map do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     if volunteer = Volunteer.find_by_id(row["id"])
  #       @import_updates+=1
  #     else
  #       volunteer = Volunteer.new
  #       volunteer.location = Location.new
  #       @import_creates+=1
  #     end
  #     volunteer.location.attributes = row.to_hash.slice!(*core_columns)
  #     volunteer.attributes = row
  #     volunteer
  #   end
  # end

  def load_imported_objects
    sheet = open_spreadsheet

    dogs = sheet.parse(id: 'id', name: 'name', chip_id: 'chip_id', breed: 'breed', sex: 'sex')
    dogHeader = dogs.delete_at(0)

    owners = sheet.parse(first_name: 'first_name', last_name: 'last_name', email: 'email', phone1: 'phone1', phone2: 'phone2')
    owenrHeader = owners.delete_at(0)

    locations = sheet.parse(line1: 'line1', line2: 'line2', city: 'city', county: 'county', code: 'code')
    locationHeader = locations.delete_at(0)

    dogs.map do |dog|
      index = dogs.index(dog)
      binding.pry
      if entry = Dog.find_by_id(dog[:id])
        @import_updates+=1
      else
        entry = Dog.new
        entry.client = Client.new
        entry.client.location = Location.new
        @import_creates+=1
      end
      entry.attributes = dog
      entry.client.attributes = owners[index]
      entry.client.location.attributes = locations[index]
      entry
    end
  end
end
