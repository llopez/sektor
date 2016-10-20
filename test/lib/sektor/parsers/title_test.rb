require 'test_helper'

class TitleTest < Minitest::Test
  def setup
    html = File.read File.expand_path("track_fragment.html", "test/data")
    @fragment = Nokogiri::HTML(html)
  end

  def test_parse
    assert_equal "We Are The Champions", Sektor::Parser::Title.new(@fragment).parse
  end
end
