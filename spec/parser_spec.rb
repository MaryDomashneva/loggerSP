require_relative '../lib/parser'

RSpec.describe Parser do
  WEBLOGS = 'data/webserver.log'.freeze
  let(:converted_hash) {
    {
      '/test1/1' => ['333.444.555.666'],
      '/test2' => ['111.222.333.555', '111.222.333.444', '111.222.333.444'],
      '/contact' => ['121.121.121.121']
    }
  }

  let(:first_line) { '/test1/1 333.444.555.666' }
  let(:second_line) { '/test2 111.222.333.555' }
  let(:third_line) { '/test2 111.222.333.444' }
  let(:fourth_line) { '/contact 121.121.121.121' }
  let(:fifth_line) { '/test2 111.222.333.444' }

  before do
    allow(File).to receive(:foreach)
      .and_yield(first_line)
      .and_yield(second_line)
      .and_yield(third_line)
      .and_yield(fourth_line)
      .and_yield(fifth_line)
  end

  describe '#conert_to_hash' do
    it 'returns hash with address as key and IP as value' do
      expect(described_class.parse(file_path: WEBLOGS)).to eq converted_hash
    end
  end
end
