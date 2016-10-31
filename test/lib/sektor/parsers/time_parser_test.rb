require 'test_helper'

class TimeParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("track_fragment.html", "test/data")
  end

  def test_parse
    assert_equal 182,
      Sektor::TimeParser.parse(@html)
  end

  def test_format
    assert_equal 180, Sektor::TimeParser.format("3:00")
    assert_equal 182, Sektor::TimeParser.format("3:02")
    assert_equal 105, Sektor::TimeParser.format("1:45")
    assert_equal 30, Sektor::TimeParser.format("0:30")
  end
end
