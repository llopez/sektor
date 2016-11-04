require "nokogiri"
require "open-uri"
require "net/http"
require "cgi"
require "json"
require "sektor/version"
require "sektor/config"
require "sektor/search"
require "sektor/parsers"

module Sektor
  def self.search(term)
    Search.new(term)
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end
end
