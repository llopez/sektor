module Sektor
  module Collector
    def self.work(term)
      url = url(term)
      page = 1
      data = []
      begin

        html = get_page(url, page)
        current_data = PageParser.parse(html)
        data += current_data

        page += 1

      end while current_data.any?
      data
    end

    def self.url(term)
      url_encoded_title = CGI.escape(term)
      "http://www.my-free-mp3.org/mp3/#{url_encoded_title}"
    end

    def self.get_page(url, page)
      open(url + "?page=#{page}").read
    end
  end
end
