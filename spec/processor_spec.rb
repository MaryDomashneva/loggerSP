require_relative '../app'

RSpec.describe Processor do
  WEBLOGS = 'data/webserver.log'.freeze

  let(:parsed_file) {
    {
      '/test1/1' => ['333.444.555.666'],
      '/test2' => ['111.222.333.555', '111.222.333.444', '111.222.333.444'],
      '/contact' => ['121.121.121.121']
    }
  }

  let(:expected_page_views) {
    [
      ['/test2', 3],
      ['/test1/1', 1],
      ['/contact', 1]
    ]
  }

  let(:expected_unique_page_views) {
    [
        ['/test2', 2],
        ['/test1/1', 1],
        ['/contact', 1]
    ]
  }

  before do
    allow(Parser).to receive(:parse).and_return(parsed_file)
  end

  describe '.process' do
    it 'calls Printer with print_page_views' do
      expect(Printer).to receive(:print_page_views).with({ views: expected_page_views })
      described_class.process(log_file: WEBLOGS)
    end

    it 'calls Printer with print_unique_page_views' do
      expect(Printer).to receive(:print_unique_page_views).with({ views: expected_unique_page_views })
      described_class.process(log_file: WEBLOGS)
    end
  end
end
