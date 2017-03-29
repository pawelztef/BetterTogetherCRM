module Exports
  class CsvExport
    def self.generate(collection, attributes=[])
      CSV.generate do |csv|
        csv << attributes.map(&:to_s)
        collection.each do |record|
          csv << record.attributes.values_at(*attributes)
        end
      end
    end
  end
end
