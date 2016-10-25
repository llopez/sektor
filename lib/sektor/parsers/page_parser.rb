module Sektor
  module PageParser
    def self.parse(html)
      doc = Nokogiri::HTML(html)

      doc.css("li.track").map do |fragment|
        TrackParser.parse(fragment.to_html)
      end
    end
  end
end
