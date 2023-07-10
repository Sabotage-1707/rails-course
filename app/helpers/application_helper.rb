module ApplicationHelper
  def links_to_content(str, width, height)
    unless str.nil? || str.empty?
    str.gsub!(%r{https://[^\s<]+}) do |url|
      if url[/(?:png|jpe?g|gif|svg)$/]
        "<img src='#{url}' width = '#{width}'; height= '#{height}' />"
      else
        "<a href='#{url}'>link to content</a>"
      end

      end
      str.html_safe
     end

  end
end
