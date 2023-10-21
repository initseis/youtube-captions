# youtube-captions

## Install
```rb
gem install youtube-captions
```
or add to gemfile
```rb
gem "youtube-captions"
```

## Usage
```rb
# "id" can be video url
video = YoutubeCaptions::Video.new(id: "abc123")
```
### Captions with default language
```rb
=> video.captions
=> [
  {
    "__content__" => "Welcome to Ruby",
    "start" => "0.16",
    "dur" => "3.92"
  }
  ...
]
```
### Captions with specific language (must be available)
```rb
=> video.captions(lang: "es")
=> [
  {
    "__content__" => "Bienvenido a Ruby",
    "start" => "0.16",
    "dur" => "3.92"
  }
  ...
]
```
### Available languages
```rb
=> video.available_langs
=> ["es", "en", "pt"]
```

## Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/sevinchek/youtube-captions/issues).

## Show your support

Give a ⭐️ if you like this project!
