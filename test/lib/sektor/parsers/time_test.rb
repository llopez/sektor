require 'test_helper'

class TimeTest < Minitest::Test
  def setup
    html = File.read File.expand_path("track_fragment.html", "test/data")
    @fragment = Nokogiri::HTML(html)
  end

  def test_parse
    assert_equal "3:02", Sektor::Parser::Time.new(@fragment).parse
  end
end
