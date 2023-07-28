# youtube-captions

## Install
```rb
gem install youtube-captions
```

```rb
gem "youtube-captions"
```

## Usage
Get captions with default language
```rb
YoutubeCaptions.new(id: "mpWFrUwAN88").call
```

Get captions with specific language (must be available)
```rb
YoutubeCaptions.new(id: "74ijsBhbxSQ", lang: "es").call
```

## To-do
Get available languages of a video

## Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/sevinchek/youtube-captions/issues).

## Show your support

Give a ⭐️ if you like this project!
