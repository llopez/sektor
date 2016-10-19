require "sektor/version"
require "nokogiri"
require "open-uri"
require "net/http"
require "sektor/track"
require "sektor/parsers"
require "sektor/filter"
require "sektor/query"

module Sektor
  def self.search(title, filters = [])
    url_encoded_title = CGI.escape(title)
    doc = Nokogiri::HTML(open("http://www.my-free-mp3.org/mp3/#{url_encoded_title}"))
    query(parse(doc), filters).result
  end

  def self.parse(doc)
    result = Parser::Track.new(doc).parse
    result.map{ |r| Track.new(*r) }
  end

  def self.query(collection, filters = [])
    query = Query.new(collection)
    filters.each do |filter|
      query.add_filter(filter[:field], filter[:predicate], filter[:value])
    end
    query
  end
end

