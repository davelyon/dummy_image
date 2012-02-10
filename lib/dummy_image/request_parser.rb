module DummyImage
  class RequestParser

    def initialize(path)
      @path, @format = path.split(".", 2)
    end

    def format
      valid_format @format
    end

    def image
      File.basename Image.find(width, height, bgcolor, fgcolor, format).path
    end

    def height
      @height ||= arguments[0] || "300"
    end

    def width
      @width ||= arguments[1] || height
    end

    def fgcolor
      @fgcolor ||= arguments[2] || "333333"
    end

    def bgcolor
      @bgcolor ||= arguments[3] || "CCCCCC"
    end

    private

    def arguments
      @arguments ||= @path.split("/").tap &:shift
    end

    def valid_format format
      if ["png", "jpg", "jpeg", "gif"].include? format
        format
      else
        "png"
      end
    end
  end
end
