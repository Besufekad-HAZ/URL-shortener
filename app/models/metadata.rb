require "open-uri"

class Metadata
    attr_reader :doc
    def self.retrieve_from(url)
      new(URI.open(url))
    rescue
      new
    end

    def initialize(html = nil)
      @doc = Nokogiri::HTML(html)
    end

    def attributes
    {
      title: title,
      description: description,
      image: image,
   }
   end

   def title
     doc.at_css("title")&.text
   end

   def description
     doc.css("meta[name=description]").first["content"]
   end

   def image
     doc.css("meta[property=og:image]").first["content"]
   end

  end
