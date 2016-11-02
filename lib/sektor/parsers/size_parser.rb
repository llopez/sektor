module Sektor
  module SizeParser
    def self.parse(fragment)
      doc = Nokogiri::HTML(fragment)
      id = doc.css("a.info").attr("data-aid").value
      uri = URI("http://#{Sektor.config.domain}/bitrate/")
      res = Net::HTTP.post_form(uri, id: id)
      format res.body.split(" ")[1]
    end

    def self.format(str)
      return 0 if str.nil?
      int, dec = str.split(".")
      int.to_i * 1024 + dec.to_i * 1024 / 100
    end
  end
end
