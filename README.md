# SillyId [![Gem Version](https://badge.fury.io/rb/silly-id.svg)](https://badge.fury.io/rb/silly-id)

Generate Heroku-like memorable random names - in different languages (currently supporting 🇬🇧 and 🇳🇱).

The source repository was forked in order to support multiple languages, and to allow for easy customization of used nouns and adjectives.

## Installation

Add this line to your application's Gemfile:

    gem 'silly-id'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install silly-id

## Usage

```ruby
SillyId.haiku # =>"rough-snowflake-1142"

# Another locale? Change your I18n.locale
I18n.available_locales = [:en, :nl]; 
I18n.locale = :nl
SillyId.haiku # => "fabuleuse-kabeljauw-3699"

# Token range
SillyId.haiku(100) # => "nameless-star-13"

# Don't include the token
SillyId.haiku(0) # => "long-flower"

# Use a different delimiter
SillyId.haiku(9999, '.') # => "cool.leaf.6743"

# No token, no delimiter
SillyId.haiku(0, ' ') # => "green fire"
```

## Supported locales

- [x] English
- [x] Dutch
- [ ] Adding your language is easy, see below ↓

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- Add adjectives and nouns for your language, see `lib/silly-id/words/`
- Report bugs
- Fix bugs and submit pull requests
- Write, clarify, or fix documentation
- Suggest or add new features
