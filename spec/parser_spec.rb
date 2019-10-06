require_relative '../lib/parser'

RSpec.describe Parser do
  WEBLOGS = 'data/webserver.log'.freeze

  let(:subject) { described_class.new(file_path: WEBLOGS) }
  let(:file_like_object) {
    double(
      [
        '/test1/1 333.444.555.666',
        '/test2 111.222.333.444',
        '/contact 121.121.121.121'
      ]
    )
  }

  before do
    allow(File).to receive(:readlines).and_return(file_like_object)
  end

  describe '#read_lines' do
    it 'returns array with each line from the file as string' do
      expect(subject.read_lines_from_file).to eq file_like_object
    end
  end

end
