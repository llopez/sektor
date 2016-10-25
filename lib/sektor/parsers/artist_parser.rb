module Sektor
  module ArtistParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      doc.css("div.track_name b.artist").text.strip
    end
  end
end

