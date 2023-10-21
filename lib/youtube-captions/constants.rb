module YoutubeCaptions
  YOUTUBE_VIDEO_URL   = "https://www.youtube.com/watch?v="
  CAPTIONABLE_REGEX  = /(\[{"baseUrl":.*"trackName":"(.*?)"}\])/
  YOUTUBE_URL_FORMATS = [
    %r((?:https?://)?youtu\.be/(.+)),
    %r((?:https?://)?(?:www\.)?youtube\.com/watch\?v=(.*?)(&|#|$)),
    %r((?:https?://)?(?:www\.)?youtube\.com/embed/(.*?)(\?|$)),
    %r((?:https?://)?(?:www\.)?youtube\.com/v/(.*?)(#|\?|$)),
    %r((?:https?://)?(?:www\.)?youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b)
  ]
end
