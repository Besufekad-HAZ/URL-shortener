require "open-uri"

class Metadata
    attr_reader :doc
    def self.retrieve_from(url)
      new(URI.parse(url))
    rescue
      new
    end

    def initialize(uri = nil)
      @doc = Nokogiri::HTML(URI.open(uri))
    end

    def attributes
    {
      title: title,
      description: description,
      image: image,
   }
   end

   def title
     doc.at_css("title").text
   end

   def description
     doc.css("meta[name=description]").first["content"]
   end

   def image
     doc.css("meta[property=og:image]").first["content"]
   end

  end