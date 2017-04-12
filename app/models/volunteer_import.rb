class VolunteerImport < ImportsExports::CsvImport

  def load_imported_objects
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      binding.pry
      row = Hash[[header, spreadsheet.row(i)].transpose]
      if volunteer = Volunteer.find_by_id(row["id"])
        @import_updates+=1
      else
        volunteer = Volunteer.new
        volunteer.location = Location.new
        @import_creates+=1
      end
      volunteer.location.attributes = row.to_hash.slice!(*core_columns)
      volunteer.attributes = row
      volunteer
    end
  end

end
