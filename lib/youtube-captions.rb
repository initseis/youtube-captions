require 'cgi'
require 'httparty'

class YoutubeCaptions
  include HTTParty

  attr_reader :id, :lang
  def initialize(id:, lang: nil)
    @id = id
    @lang = lang
  end

  TRANSLATABLE_REGEX = /({"captionTracks":.*"isTranslatable":(true|false)}\])/

  def call
    youtube_html = self.class.get("https://www.youtube.com/watch?v=#{id}")
    match_data = youtube_html.match(TRANSLATABLE_REGEX)
    raise StandardError.new("There are no captions") unless match_data

    caption_tracks = JSON.parse("#{match_data[1]}}")["captionTracks"]
    if lang.present?
      subtitle = caption_tracks.find {|json| json["vssId"] == ".#{lang}"} || caption_tracks.find {|json| json["vssId"] == "a.#{lang}"}
      if !subtitle || (subtitle && !subtitle["baseUrl"])
        raise ArgumentError.new("Lang no available")
      end
    else
      subtitle = caption_tracks.find {|json| json["vssId"] == ".en"} || caption_tracks.find {|json| json["vssId"] == "a.en"}
      subtitle = caption_tracks.first unless subtitle
    end

    transcript_html = self.class.get(subtitle["baseUrl"])
    transcript_tags = transcript_html.to_s.gsub('<?xml version="1.0" encoding="utf-8" ?><transcript>', '').gsub('</transcript>', '').split('</text>').select {|line| line && line.strip}

    transcript_parts = transcript_tags.map do |transcript_tag|
      encoded_transcript = transcript_tag.gsub(/<text.+>/, '')
                                         .gsub("/&amp;/gi", '&')
                                         .gsub("/<\/?[^>]+(>|$)/g", '')
                                         .gsub(/&amp;#(\d+);/) { [$1.to_i].pack('U*') }
      CGI.unescapeHTML(encoded_transcript)
    end

    transcript_parts.join(" ")
  end
end
