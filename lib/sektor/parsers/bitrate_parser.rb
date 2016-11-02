module Sektor
  module BitrateParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      id = doc.css("a.info").attr("data-aid").value

      uri = URI("http://#{Sektor.config.domain}/bitrate/")
      res = Net::HTTP.post_form(uri, id: id)
      res.body.split(" ")[4].to_i
    end
  end
end
