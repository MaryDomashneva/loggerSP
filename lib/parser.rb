#This calss is responsible for parsing log files
class Parser
  attr_reader :file_path

  def initialize(file_path:)
    @file_path = file_path
    @parsed_logs = []
  end

  def open_file
    File.open(file_path)
  end

end
