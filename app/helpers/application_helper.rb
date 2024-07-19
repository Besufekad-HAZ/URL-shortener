module ApplicationHelper
  include Pagy::Frontend

  def pagy_nav_tailwind(pagy)
    html = []
    pagy.series.each do |item|
      case item
      when Integer
        # Check if the item is the current page
        if item == pagy.page
          # Current page styles
          html << link_to(item, url_for(page: item), class: "px-4 py-2 border border-gray-300 bg-black text-white hover:bg-gray-700 rounded-md")
        else
          # Other page styles
          html << link_to(item, url_for(page: item), class: "px-4 py-2 border border-gray-300 bg-black text-gray-700 hover:bg-gray-100 rounded-md")
        end
      when 'gap'
        html << content_tag(:span, '…', class: "px-4 py-2 border border-gray-300 bg-black text-gray-700")
      else
        # Apply a different style if needed for the prev/next or disabled buttons
        html << content_tag(:span, item, class: "px-4 py-2 border border-gray-300 bg-white text-gray-700")
      end
    end
    safe_join(html, ' ')
  end
end
