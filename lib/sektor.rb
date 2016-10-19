require "sektor/version"
require "nokogiri"
require "open-uri"
require "net/http"
require "sektor/track"
require "sektor/parser/id"
require "sektor/parser/title"
require "sektor/parser/time"
require "sektor/parser/artist"
require "sektor/parser/size"
require "sektor/parser/bitrate"
require "sektor/parser/link"
require "sektor/parser/track"

module Sektor
  def self.search(title)
    url_encoded_title = CGI.escape(title)
    doc = Nokogiri::HTML(open("http://www.my-free-mp3.org/mp3/#{url_encoded_title}"))
    result = Parser::Track.new(doc).parse

    parse(result)
  end

  def self.parse(result)
    result.map{ |r| Track.new(*r) }
  end
end

