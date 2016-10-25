require "sektor/version"
require "nokogiri"
require "open-uri"
require "net/http"
require "cgi"
require "sektor/track"
require "sektor/parsers"
require "sektor/filter"
require "sektor/query"
require "sektor/result"

module Sektor
  def self.search(title, filters = [])
    url_encoded_title = CGI.escape(title)
    html = open("http://www.my-free-mp3.org/mp3/#{url_encoded_title}")

    data = PageParser.parse(html)
    Result.new(data)

    #query(parse(doc), filters).result
  end

  def self.parse(doc)
    result = doc.css("li.track").map do |fragment|
      Track.new(fragment).parse
    end
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
