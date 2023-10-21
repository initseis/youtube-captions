require 'httparty'

module YoutubeCaptions
  class Info
    include HTTParty

    attr_reader :id
    def initialize(id:)
      @id = id
    end

    def call
      youtube_html = self.class.get("#{YoutubeCaptions::YOUTUBE_VIDEO_URL}#{id}")
      match_data = youtube_html.match(YoutubeCaptions::CAPTIONABLE_REGEX)
      return raise NoCaptionsAvailableError.new("No captions available") unless match_data

      JSON.parse(match_data[1])
    end
  end
end
