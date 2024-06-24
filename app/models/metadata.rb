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

    def
    metadata = MetaInspector.new(url)
    {
      title: metadata.title,
      description: metadata.description,
      image: metadata.image.url
    }
  end
