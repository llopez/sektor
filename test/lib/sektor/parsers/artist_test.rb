require 'test_helper'

class ArtistTest < Minitest::Test
  def setup
    html = File.read File.expand_path("track_fragment.html", "test/data")
    @fragment = Nokogiri::HTML(html)
  end

  def test_parse
    assert_equal "Freddie Mercury & Queen", Sektor::Parser::Artist.new(@fragment).parse
  end
end
