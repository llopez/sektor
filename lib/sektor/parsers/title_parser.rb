module Sektor
  module TitleParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      doc.css("div.track_name span.name").text.strip
    end
  end
end
