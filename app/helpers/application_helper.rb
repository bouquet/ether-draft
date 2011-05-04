module ApplicationHelper
  def title(page_title)
    content_for(:title){ page_title }
  end

  def name(page_name)
    content_for(:name){ page_name }
  end

  def htmlize(content)
    Redcarpet.new(content, :smart, :filter_html).to_html.html_safe
  end
end
