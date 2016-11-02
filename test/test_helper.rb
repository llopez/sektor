$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sektor'

require 'minitest/autorun'
require 'webmock/minitest'

Sektor.configure do |c|
  c.domain = "www.example.com"
end
