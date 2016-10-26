require "sektor/version"
require "nokogiri"
require "open-uri"
require "net/http"
require "cgi"
require "sektor/parsers"
require "sektor/result"
require "sektor/collector"

module Sektor
  def self.search(term)
    data = Collector.work(term)
    Result.new(data)
  end
end

