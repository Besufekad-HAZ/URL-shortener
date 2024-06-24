class Metadata
  def self.update(link)
    link.metadata = Metadata.retrieve_from(link.url)
    link.save
  end

  def self.retrieve_from(url)
    metadata = MetaInspector.new(url)
    {
      title: metadata.title,
      description: metadata.description,
      image: metadata.image.url
    }
  end
