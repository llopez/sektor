require 'test_helper'

class LinkParserTest < Minitest::Test
  def test_parse

    @html = File.read File.expand_path("track_fragment.html", "test/data")

    assert_equal "https://mp3mp3.site/start.php?q=-50678799_422765730",
      Sektor::LinkParser.parse(@html)
  end
end
