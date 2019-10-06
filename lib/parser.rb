# frozen_string_literal: true

# This class is responsible for parsing log files
class Parser
  attr_reader :file_path
  attr_reader :parsed_logs

  def self.parse(file_path:)
    parser = new(file_path)
    parser.parse
  end

  def initialize(file_path)
    @file_path = file_path
    @parsed_logs = {}
  end

  def parse
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
end
