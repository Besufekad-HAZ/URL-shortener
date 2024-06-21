module FaviconHelper
  def favicon_image_tag(domain)
    image_tag google_favicon_url(domain)
  end
end
