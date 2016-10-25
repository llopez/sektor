require 'test_helper'

class IdParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("track_fragment.html", "test/data")
  end

  def test_parse
    assert_equal "-50678799_422765730", Sektor::IdParser.parse(@html)
  end
end
