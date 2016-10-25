require 'test_helper'

class TitleTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("track_fragment.html", "test/data")
  end

  def test_parse
    assert_equal "We Are The Champions",
      Sektor::TitleParser.parse(@html)
  end
end
