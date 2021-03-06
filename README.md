# Sektor
<img src="https://raw.githubusercontent.com/llopez/Blog/gh-pages/img/sektor.gif" height="150" align="right"/>

[![Build Status](https://travis-ci.org/llopez/sektor.svg?branch=master)](https://travis-ci.org/llopez/sektor)

Sektor is a ruby library, sektor helps you to seek and download your favorite music

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sektor', github: 'llopez/sektor'
```

And then execute:

    $ bundle

## Usage

#### bulk search

```ruby
search = Sektor.search "we are the champions"
search.all
```

### per page search

```ruby
search = Sektor.search "we are the champions"
search.page(1)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/llopez/sektor.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
