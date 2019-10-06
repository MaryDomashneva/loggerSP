# frozen_string_literal: true

# This class is responsible for counting page views
class ViewsCounter
  def self.count_page_views(parsed_file:)
    pages = parsed_file.inject({}) do |h, (key, value)|
      h[key] = value.count
      h
    end
    sort_by_most_popular_pages(pages)
  end

  def self.count_unique_view(parsed_file:)
    pages = parsed_file.inject({}) do |h, (key, value)|
      h[key] = value.uniq.count
      h
    end
    sort_by_most_popular_pages(pages)
  end

  private

  def self.sort_by_most_popular_pages(pages)
    pages.sort_by {|k, v| -v}
  end
end
