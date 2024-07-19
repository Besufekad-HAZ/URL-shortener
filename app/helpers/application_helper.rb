module ApplicationHelper
  include Pagy::Frontend

  def pagy_nav_tailwind(pagy)
    html = []

    pagy.series.each do |item|
      case item
      when Integer
        if item == pagy.page
          # Styling for the current (selected) page
          html << link_to(item, url_for(page: item), class: "px-4 py-2 mx-1 border border-gray-400 bg-blue-500 text-white rounded-md shadow-md")
        else
          # Styling for other (unselected) pages
          html << link_to(item, url_for(page: item), class: "px-4 py-2 mx-1 border border-gray-300 bg-white text-gray-700 hover:bg-gray-100 rounded-md shadow-sm")
        end
      when 'gap'
        # Styling for the gap
        html << content_tag(:span, '…', class: "px-4 py-2 mx-1 border border-gray-300 bg-white text-gray-700 rounded-md shadow-sm")
      else
        # Styling for prev/next or disabled buttons (if applicable)
        html << content_tag(:span, item, class: "px-4 py-2 mx-1 border border-gray-300 bg-white text-gray-700 hover:bg-gray-100 rounded-md shadow-sm")
      end
    end

    safe_join(html, ' ')
  end
end
