module FaviconHelper
  def favicon_tag(url)
    if url.starts_with?('http')
      tag.link href: url, rel: 'icon', type: 'image/x-icon'
    else
      tag.i class: "fa fa-#{url}", aria: {hidden: 'true'}
    end
  end
end
