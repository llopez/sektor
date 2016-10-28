module Sektor
  module PageParser
    def self.parse(html)
      doc = Nokogiri::HTML(html)
      tarr = []
      doc.css("li.track").map do |fragment|
        tarr << Thread.new do
          TrackParser.parse(fragment.to_html)
        end
      end
      tarr.map { |x| x.join }
      tarr.map { |x| x.value }
    end
  end
end
