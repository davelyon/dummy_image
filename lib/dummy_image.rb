require "dummy_image/version"

module DummyImage
  autoload :Image,          'dummy_image/image'
  autoload :Middleware,     'dummy_image/middleware'
  autoload :RequestParser,  'dummy_image/request_parser'
end
