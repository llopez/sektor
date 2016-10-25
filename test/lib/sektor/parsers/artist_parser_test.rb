require 'test_helper'

class ArtistParserTest < Minitest::Test
  def setup
    @html = File.read File.expand_path("track_fragment.html", "test/data")
  end

  def test_parse
    assert_equal "Freddie Mercury & Queen", 
      Sektor::ArtistParser.parse(@html)
  end
end
