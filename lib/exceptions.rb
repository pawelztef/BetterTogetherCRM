module Exceptions
  class FileExtensionException < StandardError
  end
  class InvalidHeadersException < StandardError
    def message 
      "Headers mismatch"
    end
  end
  class NoFileException < StandardError
    def message
      "No file choosen"
    end
  end
end
