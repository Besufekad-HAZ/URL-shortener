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
     doc.at_css("meta[name=description]")&.attributes&.fetch("content")&.text
   end

   def image
     doc.css("meta[name=og:image]")&.attributes&.fetch("content")&.text
   end

  end
