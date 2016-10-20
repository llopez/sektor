require 'test_helper'

class IdTest < Minitest::Test
  def setup
    html = File.read File.expand_path("track_fragment.html", "test/data")
    @fragment = Nokogiri::HTML(html)
  end

  def test_parse
    assert_equal "-50678799_422765730", Sektor::Parser::Id.new(@fragment).parse
  end
end
