module YoutubeCaptions
  class Video
    attr_reader :info
    def initialize(id:)
      @info = YoutubeCaptions::Info.new(id: parse_youtube_id(id)).call
    end

    def captions(lang: nil)
      YoutubeCaptions::Captions.new(info: info, lang: lang).call
    end

    def available_langs
      info.map { |json| json["languageCode"] }
    end

    private

    def parse_youtube_id(id)
      YoutubeCaptions::YOUTUBE_URL_FORMATS.find { |format| id =~ format } && $1 || id
    end
  end
end
