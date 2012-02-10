module DummyImage
  class Image

    attr_reader :arguments

    def self.find(arguments)
      new(arguments).image
    end

    def initialize arguments
      @arguments = arguments
    end

    def image_name
      [width, height, fgcolor, bgcolor].join("_") + "." + format
    end

    def width
      arguments.width
    end

    def height
      arguments.height
    end

    def fgcolor
      arguments.fgcolor
    end

    def bgcolor
      arguments.bgcolor
    end

    def format
      arguments.format
    end

    def file_path
      ["tmp", image_name].join "/"
    end

    def image
      unless File.exists? file_path
        create_image!
      end
      image_name
    end

    def caption
      [width, height].join(" x ")
    end

    def create_image!
      ImageBuilder.build width, height, fgcolor, bgcolor, caption, file_path
    end

    module ImageBuilder
      extend self
      def build width, height, fgcolor, bgcolor, caption, file_path
        system  "convert -size #{width}x#{height} -background '##{bgcolor}' -fill '##{fgcolor}' -gravity Center +pointsize label:' #{caption} ' #{file_path}"

      end
    end
  end
end
