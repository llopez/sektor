require "nokogiri"
require "open-uri"
require "net/http"
require "cgi"
require "json"
require "sektor/version"
require "sektor/result"
require "sektor/collector"
require "sektor/parsers"

module Sektor
  def self.search(term)
    data = Collector.work(term)
    Result.new(data)
  end
end

