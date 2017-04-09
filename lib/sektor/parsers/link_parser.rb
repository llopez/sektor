module Sektor
  module LinkParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      id = doc.css("a.info").attr("data-aid").value

      "https://mp3mp3.site/start.php?q=#{id}"
    end
  end
end
