#This calss is responsible for parsing log files
class Parser
  attr_reader :file_path
  attr_reader :parsed_logs

  def initialize(file_path:)
    @file_path = file_path
    @parsed_logs = {}
  end

  def conert_to_hash
    File.foreach(file_path) do |line|
      split_result = line.split
      url = split_result[0]
      ip = split_result[1]

      ip_addresses = parsed_logs.has_key?(url) ? parsed_logs[url] : []
      ip_addresses << ip
      parsed_logs[url] = ip_addresses
    end
    parsed_logs
  end

  def count_page_views
    parsed_logs.inject({}) do |h, (key, value)|
      h[key] = value.count
      h
    end
  end

  def count_unique_view
    parsed_logs.inject({}) do |h, (key, value)|
      h[key] = value.uniq.count
      h
    end
  end

  def sort_by_most_popular_pages(pages)
    pages.sort_by {|k, v| -v}
  end
end
