# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dummy_image/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dave Lyon", "Joshua Davey"]
  gem.email         = ["dave@davelyon.net", "josh@joshuadavey.com"]
  gem.description   = %q{Generate dummy images via Rack}
  gem.summary       = %q{A tiny rack app to generate dummy images on the fly for development.}
  gem.homepage      = "http://davelyon.net"

  gem.executables   = []
  gem.files         = Dir['lib/*'] + %w(README.md)
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "dummy_image"
  gem.require_paths = ["lib"]
  gem.version       = DummyImage::VERSION

  gem.add_development_dependency "rspec", "~>2.8"
  gem.add_development_dependency "rack-test", "0.6.1"

  gem.requirements << "imagemagick (convert)"
  gem.post_install_message = "Requires imagemagick with the 'convert' command"
end
