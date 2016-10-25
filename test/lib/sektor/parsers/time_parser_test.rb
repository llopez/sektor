require 'test_helper'

class TimeParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("track_fragment.html", "test/data")
  end

  def test_parse
    assert_equal "3:02",
      Sektor::TimeParser.parse(@html)
  end
end
