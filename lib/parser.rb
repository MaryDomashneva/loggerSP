# frozen_string_literal: true

# This class is responsible for parsing log files
class Parser
  def self.parse(file_path:)
    parsed_logs = {}
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
