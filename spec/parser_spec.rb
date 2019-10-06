require_relative '../lib/parser'

RSpec.describe Parser do
  WEBLOGS = 'data/webserver.log'.freeze

  let(:subject) { described_class.new(file_path: WEBLOGS) }
  let(:converted_hash) {
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
      expect(subject.conert_to_hash).to eq converted_hash
    end
  end

  describe '#count_page_views' do
    it 'returns has withn address as key and number of page views as value' do
      subject.conert_to_hash
      expect(subject.count_page_views).to eq page_views
    end
  end

  describe '#count_unique_view' do
    it 'returns has withn address as key and number of page views as value' do
      subject.conert_to_hash
      expect(subject.count_unique_view).to eq unique_page_views
    end
  end

  describe '#sort_by_most_popular_pages' do
    it 'sorts pages hash from most popular pages to less popular' do
      subject.conert_to_hash
      pages = subject.count_page_views
      expect(subject.sort_by_most_popular_pages(pages)).to eq sort_page_views
    end
  end
end
