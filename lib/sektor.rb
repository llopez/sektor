require "sektor/version"
require "nokogiri"
require "open-uri"
require "net/http"
require "sektor/track"
require "sektor/parsers"

module Sektor
  def self.search(title)
    url_encoded_title = CGI.escape(title)
    doc = Nokogiri::HTML(open("http://www.my-free-mp3.org/mp3/#{url_encoded_title}"))
    parse(doc)
  end

  def self.parse(doc)
    result = Parser::Track.new(doc).parse
    result.map{ |r| Track.new(*r) }
  end
end

