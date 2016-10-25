module Sektor
  module SizeParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      id = doc.css("a.info").attr("data-aid").value
      uri = URI("http://www.my-free-mp3.org/bitrate/")
      res = Net::HTTP.post_form(uri, id: id)
      res.body.split(" ")[1]
    end
  end
end
