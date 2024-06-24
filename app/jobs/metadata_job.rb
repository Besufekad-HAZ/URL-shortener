class MetadataJob < ApplicationJob
  def perform(id)
    link = Link.find(id)
    Metadata.update(link)
  end
end
