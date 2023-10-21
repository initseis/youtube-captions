module YoutubeCaptions
  class Error < StandardError; end
  class NoCaptionsAvailableError < Error; end
  class LangNotAvailableError < Error; end
end
