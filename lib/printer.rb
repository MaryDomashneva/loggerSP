# frozen_string_literal: true

# This class is responsible for printing the page views information
class Printer
  def self.print_page_views(views:)
    views.each do |elem|
      print "Page: #{elem[0]} has #{elem[1]} views\n"
    end
  end

  def self.print_unique_page_views(views:)
    views.each do |elem|
      print "Page: #{elem[0]} has #{elem[1]} unique views\n"
    end
  end
end
