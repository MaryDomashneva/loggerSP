require_relative '../lib/views_counter'

RSpec.describe ViewsCounter do
  let(:subject) { described_class.new(parsed_file: parsed_file) }
  let(:parsed_file) {
    {
      '/test1/1' => ['333.444.555.666'],
      '/test2' => ['111.222.333.555', '111.222.333.444', '111.222.333.444'],
      '/contact' => ['121.121.121.121']
    }
  }

  let(:page_views) {
    {
        '/test1/1' => 1,
        '/test2' => 3,
        '/contact' => 1
    }
  }

  let(:unique_page_views) {
    {
      '/test1/1' => 1,
      '/test2' => 2,
      '/contact' => 1
    }
  }

  let(:sort_page_views) {
    [
      ['/test2', 3],
      ['/test1/1', 1],
      ['/contact', 1]
    ]
  }

  describe '#count_page_views' do
    it 'returns has withn address as key and number of page views as value' do
      expect(subject.count_page_views).to eq page_views
    end
  end

  describe '#count_unique_view' do
    it 'returns has withn address as key and number of page views as value' do
      expect(subject.count_unique_view).to eq unique_page_views
    end
  end

  describe '#sort_by_most_popular_pages' do
    it 'sorts pages hash from most popular pages to less popular' do
      pages = subject.count_page_views
      expect(subject.sort_by_most_popular_pages(pages)).to eq sort_page_views
    end
  end
end
