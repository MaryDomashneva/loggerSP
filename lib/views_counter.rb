#this class is responsible for counting page views
class ViewsCounter
  attr_reader :parsed_file

  def initialize(parsed_file:)
    @parsed_file = parsed_file
  end

  def count_page_views
    parsed_file.inject({}) do |h, (key, value)|
      h[key] = value.count
      h
    end
  end

  def count_unique_view
    parsed_file.inject({}) do |h, (key, value)|
      h[key] = value.uniq.count
      h
    end
  end

  def sort_by_most_popular_pages(pages)
    pages.sort_by {|k, v| -v}
  end
end
