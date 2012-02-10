# DummyImage

A tiny rack app to generate dummy images on the fly for development, or fall back to a url in other environments.

## Requirements

* imagemagick (with 'convert' command line tool)

## Installation

Add this line to your application's Gemfile:

    gem 'dummy_image'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dummy_image

## Usage

This is a rack app that responds to the following URLS:

	/width.(format)
	/width/height.(format)
	/width/height/background.(format)
	/width/height/background/foreground.(format)

Where *mount* is the location where the app is mounted

## Rails Usage

In your config/routes.rb add:

	mount DummyImage::Middleware, at: '/dummy'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
