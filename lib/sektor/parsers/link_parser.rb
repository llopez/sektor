module Sektor
  module LinkParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      id = doc.css("a.info").attr("data-aid").value

      "http://s.myfreemp3.space/s.php?q=#{id}"
    end
  end
end
