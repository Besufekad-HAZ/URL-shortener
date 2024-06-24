class Metadata
    def self.retrieve_from(url)
      new()
    metadata = MetaInspector.new(url)
    {
      title: metadata.title,
      description: metadata.description,
      image: metadata.image.url
    }
  end
