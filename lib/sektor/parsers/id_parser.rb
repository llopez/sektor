module Sektor
  module IdParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      doc.css("a.info").attr("data-aid").value
    end
  end
end

