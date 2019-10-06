# frozen_string_literal: true

# This class is responsible for printing the page views information
class Printer
  attr_reader :uniq_views, :views

  def self.print(views:, uniq_views:)
    printer = new(views, uniq_views)
    printer.print
  end

  def initialize(views, uniq_views)
    @views = views
    @uniq_views = uniq_views
  end

  def print
    print_page_views
    print_unique_page_views
  end

  private

  def print_page_views
    views.each do |elem|
      print "Page: #{elem[0]} has #{elem[1]} views"
    end
  end

  def print_unique_page_views
    uniq_views.each do |elem|
      print "Page: #{elem[0]} has #{elem[1]} unique views"
    end
  end
end
