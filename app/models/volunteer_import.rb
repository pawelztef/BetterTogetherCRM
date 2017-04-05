class VolunteerImport < Exports::CsvExport

  def initialize(attributes = {})
    super
    @klass = "Volunteer"
  end
  def location_columns
    ['line9', 'line2', 'city', 'county', 'code']
  end

end
