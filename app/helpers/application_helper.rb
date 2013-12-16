module ApplicationHelper
  def full_title(base_title, page_title)
    if page_title.blank?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
