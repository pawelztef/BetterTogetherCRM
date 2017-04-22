module ImportsExports 
  class CsvImport
    include ActiveModel::Model
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations
    include Exceptions


    attr_accessor :file, :import_updates, :import_creates, :notice


    def initialize(attributes = {})
      attributes.each do |name, value| 
        send("#{name}=", value)
      end
      @import_updates = @import_creates = 0
    end

    def persisted?
      false
    end

    def save
      if imported_objects.map(&:valid?).all?
        imported_objects.each(&:save!)
        @notice = "Import completed. #{@import_creates} created, #{@import_updates} updated"
        true
      else
        imported_objects.each_with_index do |generic_object, index|
          generic_object.errors.full_messages.each do |message|
            errors.add :base, "Row #{index+2}: #{message}"
          end
        end
        false
      end
    end

    def imported_objects
      @imported_objects ||= load_imported_objects
    end

    def open_spreadsheet
      case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      else 
        raise Exceptions::FileExtensionException.new("Unknown file type: #{file.original_filename}")
      end
    end

    def load_imported_objects
      raise "This method should be over-ridden by a sub-class"
    end

    def self.check_headers(sheet)
      raise Exceptions::InvalidHeadersException unless (sheet.row(1)-columns).empty?
    end

    def self.columns
      raise "This method should be over-ridden by a sub-class"
    end

  end
end
