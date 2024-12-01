require_relative "lib/youtube-captions/version"

Gem::Specification.new do |gem|
  gem.authors = ["Kevin S."]
  gem.files = Dir["lib/**/*.rb"]
  gem.name = "youtube-captions"
  gem.summary = "A gem to get captions of a youtube video"
  gem.version = YoutubeCaptions::VERSION
  gem.required_ruby_version = '>=2.3.0'
  gem.add_runtime_dependency "httparty"
  gem.add_runtime_dependency "nokogiri"
  gem.add_development_dependency "rspec"
  gem.homepage = "https://github.com/sevinchek/youtube-captions"
end
