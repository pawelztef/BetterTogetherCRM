class VolunteerImport
  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file, :import_updates, :import_creates, :notice

  # "Import completed. 4 created, 2 updated"

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
    @import_updates = @import_creates = 0
  end

  def persisted?
    false
  end

  def save
    if imported_volunteers.map(&:valid?).all?
      imported_volunteers.each(&:save!)
      @notice = "Import completed. #{@import_creates} created, #{@import_updates} updated"
      true
    else
      imported_volunteers.each_with_index do |volunteer, index|
	volunteer.errors.full_messages.each do |message|
	  errors.add :base, "Row #{index+2}: #{message}"
	end
      end
      false
    end
  end

  def imported_volunteers
    @imported_volunteers ||= load_imported_volunteers
  end

  def load_imported_volunteers
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      if volunteer = Volunteer.find_by_id(row["id"])
	@import_updates+=1
      else
	volunteer = Volunteer.new
	@import_creates+=1
      end
      # volunteer = Volunteer.find_by_id(row["id"]) || Volunteer.new 
      volunteer.attributes = row.to_hash.slice(*columns)
      volunteer
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def columns
    ['id', 'first_name', 'last_name', 'phone1', 'email', 'phone2']
  end


end
