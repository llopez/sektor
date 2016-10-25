module Sektor
  class BitrateParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      id = doc.css("a.info").attr("data-aid").value

      uri = URI("http://www.my-free-mp3.org/bitrate/")
      res = Net::HTTP.post_form(uri, id: id)
      res.body.split(" ")[4].to_i
    end
  end
end

