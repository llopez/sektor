module Sektor
  module TimeParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      format doc.css("div.add_panel div.track_time").text.strip
    end

    def self.format(str)
      min, sec = str.split(":")
      min.to_i * 60 + sec.to_i
    end
  end
end
