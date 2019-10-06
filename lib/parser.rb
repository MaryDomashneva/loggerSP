#This calss is responsible for parsing log files
class Parser
  attr_reader :file_path

  def initialize(file_path:)
    @file_path = file_path
    @parsed_logs = []
  end

  def read_lines_from_file
    File.readlines(file_path)
  end

  def conert_to_hash
    read_lines_from_file.inject({}) do |h,elem|
      h[elem.split[0]] = elem.split[1]
      h
    end
  end
end
