require_relative '../app'

RSpec.describe ViewsCounter do
  let(:parsed_file) {
    {
      '/test1/1' => ['333.444.555.666'],
      '/test2' => ['111.222.333.555', '111.222.333.444', '111.222.333.444'],
      '/contact' => ['121.121.121.121']
    }
  }

  let(:sort_page_views) {
    [
      ['/test2', 3],
      ['/test1/1', 1],
      ['/contact', 1]
    ]
  }

  let(:sort_unique_page_views) {
    [
      ['/test2', 2],
      ['/test1/1', 1],
      ['/contact', 1]
    ]
  }

  describe '.count_page_views' do
    it 'returns has with address as key and number of page views as value' do
      expect(described_class.count_page_views(parsed_file: parsed_file)).to eq sort_page_views
    end
  end

  describe '.count_unique_view' do
    it 'returns has with address as key and number of page views as value' do
      expect(described_class.count_unique_view(parsed_file: parsed_file)).to eq sort_unique_page_views
    end
  end
end
