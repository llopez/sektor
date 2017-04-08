module Sektor
  class Search
    def initialize(term)
      @term = term
    end

    def page(page)
      html = open(url + "?page=#{page}", proxy: Sektor.config.proxy).read
      PageParser.parse(html)
    end

    def all
      n = 1
      data = []
      begin
        page_data = page(n)
        data += page_data
        n += 1
      end while page_data.any?
      data
    end

    def url
      url_encoded_title = CGI.escape(@term)
      "https://#{Sektor.config.domain}/mp3/#{url_encoded_title}"
    end
  end
end
