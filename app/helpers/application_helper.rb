module ApplicationHelper
  include Pagy::Frontend

  def pagy_nav_tailwind(pagy)
    html = []
    pagy.series.each do |item|
      case item
      when Integer
        if item == pagy.page
          # Styling for the current (selected) page: Dark blue background, white text
          html << link_to(item, url_for(page: item), class: "px-4 py-2 mx-1 border border-blue-500 bg-black text-white rounded-md")
        else
          # Styling for other (unselected) pages: Light blue background, dark blue text, hover effect
          html << link_to(item, url_for(page: item), class: "px-4 py-2 mx-1 border border-slate-500 bg-black text-white hover:bg-slate-400 rounded-md")
        end
      when 'gap'
        # Styling for the gap: Gray text, indicating unclickable
        html << content_tag(:span, '…', class: "px-4 py-2 mx-1 border border-gray-300 bg-white text-gray-500 rounded-md")
      else
        # Styling for prev/next or disabled buttons (if applicable): Standard styling
        html << content_tag(:span, item, class: "px-4 py-2 mx-1 border border-gray-300 bg-white text-gray-700 hover:bg-gray-200 rounded-md")
      end
    end
    safe_join(html, ' ')
  end
end
