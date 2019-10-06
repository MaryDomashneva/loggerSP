require_relative '../app'

# This class is responsible for processing the web log file
class Processor
  def self.process(log_file:)
    parsed_file = Parser.parse(file_path: log_file)
    page_views = ViewsCounter.count_page_views(parsed_file: parsed_file)
    unique_page_view = ViewsCounter.count_unique_view(parsed_file: parsed_file)
    Printer.print_page_views(views: page_views)
    Printer.print_unique_page_views(views: unique_page_view)
  end
end
