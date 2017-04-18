class DogsImport < ImportsExports::CsvImport

  def load_imported_objects
    sheet = open_spreadsheet
    dogs = sheet.parse(id: 'id', name: 'name', chip_id: 'chip_id', age: 'age', breed: 'breed', sex: 'sex')
    dogHeader = dogs.delete_at(0)
    owners = sheet.parse(first_name: 'first_name', last_name: 'last_name', email: 'email', phone1: 'phone1', phone2: 'phone2')
    owenrHeader = owners.delete_at(0)
    locations = sheet.parse(line1: 'line1', line2: 'line2', city: 'city', county: 'county', code: 'code')
    locationHeader = locations.delete_at(0)

    dogs.map do |dog|
      index = dogs.index(dog)
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

  def columns
    ['id', 'name', 'chip_id', 'age', 'breed', 'sex',
     'first_name', 'last_name', 'email', 'phone1', 'phone2',
    'line1', 'line2', 'city', 'county', 'code']
  end

end
