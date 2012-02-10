module DummyImage
  module Middleware
    extend self
    IMAGE_DIR = ::File.expand_path("tmp")

    def call(env)
      requested_path = env["PATH_INFO"]
      env_hash = { "PATH_INFO" => image_path(requested_path),
                   "REQUEST_METHOD" => "GET" }
      Rack::File.new(IMAGE_DIR).call( env_hash )
    end

    def image_path(requested_path)
      arguments = RequestParser.new(requested_path)
      Image.find arguments
    end
  end
end
