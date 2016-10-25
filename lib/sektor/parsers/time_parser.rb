module Sektor
  module TimeParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      doc.css("div.add_panel div.track_time").text.strip
    end
  end
end
