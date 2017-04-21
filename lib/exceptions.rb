module Exceptions
  class FileExtensionException < StandardError
  end
  class InvalidColumnHeaderException < StandardError
  end
  class NoFileException < StandardError
    def message
      "No file choosen"
    end
  end
end
