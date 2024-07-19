module ApplicationHelper
  include Pagy::Frontend
  def pagy_nav_tailwind(pagy)
    html = []
    pagy.series.each do |item|
      case item
      when Integer
        html << link_to(item, url_for(page: item), class: "px-4 py-2 border border-gray-300 bg-white text-gray-700 hover:bg-gray-100 rounded-md")
      when 'gap'
        html << content_tag(:span, '…', class: "px-4 py-2 border border-gray-300 bg-white text-gray-700")
      else
        html << content_tag(:span, item, class: "px-4 py-2 border border-gray-300 bg-white text-gray-700")
      end
    end
    safe_join(html, ' ')
  end
end
end
