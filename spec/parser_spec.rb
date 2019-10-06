require_relative '../lib/parser'

RSpec.describe Parser do
  WEBLOGS = 'data/webserver.log'.freeze

  let(:subject) { described_class.new(file_path: WEBLOGS) }
  let(:file_like_object) { double("file like object") }

  before do
    allow(File).to receive(:open).and_return(file_like_object)
  end

  describe '#open_file' do
    it 'opens a file from a file path' do
      expect(subject.open_file).to eq file_like_object
    end
  end

end
