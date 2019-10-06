require_relative '../app'

RSpec.describe Printer do
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

  describe '.print_page_views' do
    it 'prints number of visits per page' do
      expect { described_class.print_page_views(views: sort_page_views) }.to output(
        "Page: /test2 has 3 views\n"\
        "Page: /test1/1 has 1 views\n"\
        "Page: /contact has 1 views\n"
      ).to_stdout
    end
  end

  describe '.print_unique_page_views' do
    it 'prints number of unique visits per page' do
      expect { described_class.print_unique_page_views(views: sort_unique_page_views) }.to output(
        "Page: /test2 has 2 unique views\n"\
        "Page: /test1/1 has 1 unique views\n"\
        "Page: /contact has 1 unique views\n"
      ).to_stdout
    end
  end
end
